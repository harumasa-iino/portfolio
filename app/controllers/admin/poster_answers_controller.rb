class Admin::PosterAnswersController < ApplicationController
  before_action :set_poster
  before_action :set_questions
  before_action :set_poster_answers, only: %i[edit_multiple update_multiple]

  def new
    @poster_answer = PosterAnswer.new
  end

  def create
    poster_answers_params[:poster_answers].each do |key, answer|
      question = Question.find(key[0])
      @poster_answer = PosterAnswer.new(option: answer[:option], poster_id: @poster.id)
      @poster_answer.question = question
      @poster_answer.save!
    end

    redirect_to admin_poster_path(@poster), notice: 'Poster answers were successfully submitted.'
  end

  def edit_multiple; end

  def update_multiple
    poster_answers_params[:poster_answers].each do |key, answer|
      question_id = key[0].to_i
      poster_answer = @poster.poster_answers.find_by(question_id:)
      poster_answer.update(option: answer[:option]) if poster_answer
    end

    redirect_to admin_poster_path(@poster), notice: 'Poster answers were successfully updated.'
  end

  private

  def set_poster
    @poster = Poster.find(params[:poster_id])
  end

  def set_questions
    @questions = Question.find([1, 2, 3, 4, 5])
  end

  def set_poster_answers
    @poster_answers = @poster.poster_answers.includes(:question)
  end

  def poster_answers_params
    params.require(:poster_answer).permit(poster_answers: {})
  end
end
