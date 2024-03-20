# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  def new
    @room = Room.new
  end

  def show
    return if @room.session_id == session[:session_id]

    redirect_to root_path, notice: t('messages.rooms.show_danger')
  end

  def create
    ensure_session

    @room = Room.new(room_params)
    @room.session_id = session[:session_id]
    if @room.save
      redirect_to room_path(@room), notice: t('messages.rooms.upload_success')
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
