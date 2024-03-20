require 'rails_helper'

RSpec.describe 'Question and Answer flow', type: :request do
  before do
    # データベースに質問を設定
    @questions = [
      Question.create!(id: 1, body: 'デザインのスタイル', first_option: 'モダン', second_option: 'クラシック'),
      Question.create!(id: 2, body: '色使いについて', first_option: '明るい色', second_option: '落ち着いた色'),
      Question.create!(id: 3, body: 'アートワークについて', first_option: '写真', second_option: 'イラスト'),
      Question.create!(id: 4, body: 'レイアウトについて', first_option: 'シンプル', second_option: '派手'),
      Question.create!(id: 5, body: '雰囲気について', first_option: '落ち着いた雰囲気', second_option: '華やかな雰囲気')
    ]
  end

  it 'navigates through questions choosing the first option and ends up on the answers index page' do
    @questions.each_with_index do |question, index|
      # 各質問にアクセス
      get question_path(question)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(question.body)

      # 最初のオプションを選択
      post answers_path, params: {
        answer: {
          question_id: question.id,
          option: 0 # 最初のオプション
        }
      }

      # 最後の質問の後には回答完了ページへリダイレクトされる
      if question == @questions.last
        expect(response).to redirect_to(composite_images_path) # 仮に回答完了ページがanswers_pathだと仮定
        follow_redirect!
        expect(response.body).to include('回答完了')
        # ここで回答完了ページの特定のコンテンツをチェック
      else
        # 次の質問にリダイレクトされる
        expect(response).to redirect_to(question_path(@questions[index + 1]))
      end
    end
  end
end
