class CompositeImagesController < ApplicationController
  before_action :set_room, only: %i[index show]
  before_action :set_composite_image, only: %i[show save]

  def index
    referrer_path = URI(request.referrer || '').path

    if referrer_path.include?('questions') || referrer_path.include?('rooms')
      matched_posters = match_posters_based_on_referrer
      @composite_images = matched_posters.map { |poster| create_composite_image(poster) }.uniq { |ci| ci.poster_id }
      # 生成した@composite_imagesのIDをセッションに保存
      session[:composite_image_ids] = @composite_images.map(&:id)
    else
      # referrerにquestionsもroomsも含まれていない場合、セッションからcomposite_image_idsを使用してデータを取得
      composite_image_ids = session[:composite_image_ids] || []
      @composite_images = CompositeImage.where(id: composite_image_ids)
    end
  end

  def show; end

  def save
    if user_signed_in?
      @composite_image.update(user_id: current_user.id)
      redirect_to @composite_image, notice: t('messages.composite_images.save_success')
    else
      # ユーザーがログインしていない場合は、サインアップ画面にリダイレクト
      session[:return_to] = composite_image_path(@composite_image)
      redirect_to new_user_registration_path
    end
  end

  private

  def set_room
    session_id = session[:session_id]
    @room = Room.where(session_id: session_id).order(:created_at).last
  end

  def match_posters_based_on_referrer
    referrer_path = URI(request.referrer || '').path

    if referrer_path.include?('questions')
      FilterMatchingService.new(session[:session_id]).match_posters.uniq
    elsif referrer_path.include?('rooms')

      ColorMatchingService.new(@room.id).match_posters
    end
  end

  def set_composite_image
    @composite_image = CompositeImage.find(params[:id])
  end

  def create_composite_image(poster)
    wallpaper_path = @room.image.path
    poster_path = poster.image.path
    CompositeImage.create_composite(
    @room.id, 
    wallpaper_path, 
    poster_path, 
    poster.id, 
    poster.width, 
    poster.height, 
    @room.x_coordinate, 
    @room.y_coordinate
  )
  end
end
