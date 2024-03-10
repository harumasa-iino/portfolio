class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
    @answer = Answer.new
  end
end
