class PostersController < ApplicationController
  def show
    @poster = Poster.find(params[:id])
  end
end
