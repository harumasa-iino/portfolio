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
      save_colors(@room)
      redirect_to room_path(@room), notice: t('messages.rooms.upload_success')
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def save_colors(room)
    relative_path = room.image.url.sub(/^\//, '')
    image_path = Rails.root.join('public', relative_path).to_s
    colors = VisionService.detect_colors(image_path)

    colors.each do |color_data|
      color = Color.find_or_create_by(hex: color_data[:hex], rgb: color_data[:rgb])
      RoomColor.create(room: room, color: color, pixel_fraction: color_data[:pixel_fraction])
    end
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:image, :image_cache)
  end
end
