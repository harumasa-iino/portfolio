class CompositeImagesController < ApplicationController

  def index
    # ここでパラメータから壁紙とポスターのパスを取得します
    session_id = session[:session_id]
    user_result = UserResult.where(session_id:).order(created_at: :desc).first

    category_id = user_result.category_id
    poster_results = PosterResult.where(category_id:)
    poster = Poster.where(id: poster_results.pluck(:poster_id)).first

    room = Room.find_by(session_id:)

    wallpaper_path = room.image.path
    poster_path = poster.image.path
    CompositeImage.create_composite(room.id, wallpaper_path, poster_path)

    @composite_image = CompositeImage.where(room_id: room.id).order(id: :desc).first
  end

  def show
    session_id = session[:session_id]
    user_result = UserResult.where(session_id:).order(created_at: :desc).first

    category_id = user_result.category_id
    poster_results = PosterResult.where(category_id:)
    @poster = Poster.where(id: poster_results.pluck(:poster_id)).first
  end
end
