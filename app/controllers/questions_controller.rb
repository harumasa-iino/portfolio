class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @total_questions = Question.count
    @current_question_number = Question.where('id <= ?', @question.id).count
  end

  def index
    @questions = Question.all
    @answer = Answer.new
  end
end
