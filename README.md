# <img src="app/assets/images/favicon.ico" width="2%"> Frame Select
<img src="app/assets/images/ogp.png" width="50%">

## ■サービス概要 
部屋に合うポスターや絵画を提案してくれるサービスです  
ポスターや絵画を飾りたいと考えている壁を撮影して、デザインの好みの質問に答えるorレコメンドしてもらうことで、インテリアの雰囲気にあった絵を提案、実際に飾った場合どのような見た目になるのかを見ることが出来ます  
ポスターが気に入ればそのまま購入できるような導線も用意しています

### ■ このサービスへの思い・作りたい理由 
1人暮らしを始めたとき、コンクリート打ちっぱなしの部屋でなにか絵やポスターを飾りたいと思ったが、 実際にどんなポスターが今のインテリアに合うのか、実際に飾ったら部屋のイメージがどのようになるのかが分からなかったため買うことが無かった。  
しかし、最近きっかけがあって飾るようになったところ部屋のインテリアに統一感が出たことから、飾るハードルを少しでも下げるきっかけになるサービスを提供したいと思いました。

### ■ ユーザー層について
ひとり暮らしを初めて、部屋のインテリアを充実させたいと思っている男女20代  
インテリアを自分で考えるようになる最初のタイミングであるひとり暮らし初めであること、どんなものにしようか迷う層がターゲットです  

### ■サービスの利用イメージ
飾る絵やポスターのイメージに迷った際に、アプリを利用することで部屋のインテリアに合ったポスターや絵を知ることができる。
実際に飾るイメージを知れることで購入のハードルが下がり、実際に飾って理想のインテリアに近づけることが出来る。

### 色彩マッチング機能
<video src="https://github.com/harumasa-iino/portfolio/assets/139933050/a449a951-0e98-4e79-adf8-4866c5a8f530
" controls="true" width="600" ></video>

### AI画像マッチング機能
<video src="https://github.com/harumasa-iino/portfolio/assets/139933050/38eeb7cd-f450-4884-87e8-45c48be0ac1e
" controls="true" width="600" ></video>


## ■ 使用技術一覧
<img src="https://img.shields.io/badge/-Node.js-000000.svg?logo=node.js&style=for-the-badge">
<img src="https://img.shields.io/badge/-JavaScript-000000.svg?style=for-the-badge&logo=JavaScript&logoColor=F7DF1E">
<img src="https://img.shields.io/badge/-Rails-CC0000.svg?style=for-the-badge&logo=rails&logoColor=white">
<img src="https://img.shields.io/badge/-Ruby-CC342D.svg?logo=ruby&style=for-the-badge">
<img src="https://img.shields.io/badge/-Nginx-269539.svg?logo=nginx&style=for-the-badge">
<img src="https://img.shields.io/badge/-MySQL-4479A1.svg?logo=mysql&style=for-the-badge&logoColor=white">
<img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=for-the-badge">
<img src="https://img.shields.io/badge/-githubactions-FFFFFF.svg?logo=github-actions&style=for-the-badge">
<img src="https://img.shields.io/badge/-Amazon%20aws-232F3E.svg?logo=amazon-aws&style=for-the-badge">
<img src="https://img.shields.io/badge/-Amazon%20ec2-232F3E.svg?logo=amazon-ec2&style=for-the-badge">

## ■ 使用技術詳細
- Ruby 3.1.4
- Ruby on Rails 7.0.8
- MySQL 8.3.0
- Nginx
- Bootstrap
- Puma
- AWS
    - VPC
    - EC2
    - RDS
    - Route53
- Docker/Docker-compose
- GitHub Actions
- RSpec
- Google Vision API
- OpenAI API DALL·E 3

## AWS構成図
[![AWS](https://i.gyazo.com/50ab50f3ea8099ac15005fa64b3b98a4.png)](https://gyazo.com/50ab50f3ea8099ac15005fa64b3b98a4)

### CI/CD
- Git hubでmasterへマージした際にGit hub ActionsによってEC2へ自動デプロイが実行されます

## ■ 機能一覧
- 認証機能(device)
    - ユーザー登録
    - ログイン
    - ログアウト
    - Googleアカウントでのログイン・登録(Google Oauth)
    - パスワードの再設定
- 画像アップロード(CarrierWave)
- ポスターとのマッチング機能
    - デザインタイプの質問/回答
    - 画像解析(Google Vision API)によるレコメンド機能
- 画像合成機能(MiniMagic)
- AI画像生成機能(OpenAI API DALL·E 3)
- マイページへの画像保存
- ポスター/絵画データベース
- ポスターの購入導線

### テスト
- RSpec

## ER図
[![ER](https://i.gyazo.com/456dc05cc863991975340a6adf4abf96.png)](https://gyazo.com/456dc05cc863991975340a6adf4abf96)
