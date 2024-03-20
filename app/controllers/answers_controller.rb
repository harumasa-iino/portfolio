class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.session_id = session[:session_id]
    # save!ではsession_idが保存されない。バリデーションエラーのため？binding.pryで確かめる
    @answer.save!
    if @answer.question_id < Question.last.id
      redirect_to question_path(@answer.question_id + 1)
    else
      redirect_to composite_images_path, notice: t('messages.answers.create_success')
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :option)
  end
end
