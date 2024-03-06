class AnswersController < ApplicationController
  def index
    session_id = session[:session_id]
    user_result = UserResult.where(session_id:).order(created_at: :desc).first

    if user_result
      category_id = user_result.category_id
      poster_results = PosterResult.where(category_id:)
      @posters = Poster.where(id: poster_results.pluck(:poster_id))
    else
      @posters = [] # もしUserResultが存在しない場合のデフォルト値を設定
    end
  end

  def create
    ActiveRecord::Base.transaction do
      @answer = Answer.new(answer_params)
      @answer.session_id = session[:session_id]
      # save!ではsession_idが保存されない。バリデーションエラーのため？binding.pryで確かめる
      @answer.save
      if @answer.question_id < Question.last.id
        redirect_to question_path(@answer.question_id + 1)
      else
        redirect_to answers_path
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :option)
  end
end
