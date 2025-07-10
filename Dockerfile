# =================================================================
# ビルド全体で使う変数をARGで定義
# =================================================================
ARG YARN_VERSION=1.22.19

# =================================================================
# ステージ1: Node.jsとYarnを準備するビルド環境
# =================================================================
# DebianベースのNode.jsイメージに変更し、OSの互換性を確保
FROM node:16-bullseye-slim AS node-builder

# このステージで使うARGを再宣言
ARG YARN_VERSION

# ca-certificates を追加してSSL証明書の問題を解決
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && rm -rf /var/lib/apt/lists/*

# Yarnをダウンロードして/opt配下に展開する
RUN curl -fsSL "https://github.com/yarnpkg/yarn/releases/download/v$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  | tar -xzC /opt

# =================================================================
# ステージ2: 最終的に使用するアプリケーションイメージ
# =================================================================
FROM ruby:3.1.4

# このステージで使う変数を再度宣言
ARG YARN_VERSION
ARG RUBYGEMS_VERSION=3.3.20

# <<< 修正点: PostgreSQL用からMySQL用のパッケージに変更
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /portfolio

# -----------------------------------------------------------------
# node-builderステージからNode.jsとYarnをコピー
# -----------------------------------------------------------------
COPY --from=node-builder /usr/local/bin/node /usr/local/bin/
COPY --from=node-builder /opt/yarn-v${YARN_VERSION} /opt/yarn

# nodeとyarnの両方にPATHを通す
ENV PATH /usr/local/bin:/opt/yarn/bin:$PATH

# -----------------------------------------------------------------
# GemとYarnパッケージのインストール
# -----------------------------------------------------------------
COPY Gemfile Gemfile.lock ./
RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

COPY package.json yarn.lock ./
RUN yarn install

# -----------------------------------------------------------------
# アプリケーションコードのコピーと設定
# -----------------------------------------------------------------
COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
