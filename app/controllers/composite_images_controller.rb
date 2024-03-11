class CompositeImagesController < ApplicationController
  before_action :set_room_and_poster, only: [:index]

  def index
    wallpaper_path = @room.image.path
    poster_path = @poster.image.path
    CompositeImage.create_composite(@room.id, wallpaper_path, poster_path)

    @composite_image = CompositeImage.where(room_id: @room.id).order(id: :desc).first
  end

  def show
    set_room_and_poster
  end
end

  private

  def set_room_and_poster
    session_id = session[:session_id]
    user_result = UserResult.where(session_id:).order(created_at: :desc).first
    return unless user_result

    @poster = Poster.joins(:poster_results).find_by(poster_results: {category_id: user_result.category_id})
    @room = Room.find_by(session_id: session_id)
  end
