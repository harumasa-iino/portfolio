# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  def new
    @room = Room.new
  end

  def show; end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room), notice: 'Room was successfully upload.'
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:image, :image_cache)
  end
end
