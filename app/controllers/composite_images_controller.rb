class CompositeImagesController < ApplicationController
  before_action :set_room_and_poster, only: [:index, :show]
  before_action :set_composite_image, only: [:show, :save]

  def index
    wallpaper_path = @room.image.path
    poster_path = @poster.image.path
    CompositeImage.create_composite(@room.id, wallpaper_path, poster_path, @poster.id)
    # 何回も合成していると同じ画像が出てきてしまうためfirstにしているが、posterとroomの組み合わせをuniqueにしたい
    @composite_image = CompositeImage.where(room_id: @room.id).order(id: :desc).first
  end

  def show;  end

  def save
    if user_signed_in?
      @composite_image.update(user_id: current_user.id)
      redirect_to @composite_image, notice: '画像が保存されました。'
    else
      # ユーザーがログインしていない場合は、サインアップ画面にリダイレクト
      session[:return_to] = composite_image_path(@composite_image)
      redirect_to new_user_registration_path
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

  def set_composite_image
    @composite_image = CompositeImage.find(params[:id])
  end
end