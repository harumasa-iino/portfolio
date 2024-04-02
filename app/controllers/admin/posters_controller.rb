class Admin::PostersController < Admin::BaseController
  before_action :set_poster, only: %i[show edit update destroy]
  def index
    @posters = Poster.all
  end

  def new
    @poster = Poster.new
  end

  def create
    @poster = Poster.new(poster_params)

    if @poster.save
      redirect_to admin_posters_path, notice: 'Posterが正常に作成されました。'
    else
      render :new
    end
  end

  def show
    @poster_answer = PosterAnswer.find_by(poster_id: @poster.id)
    @pattern = @poster.poster_answers.extract_bit_pattern(@poster.id)
  end

  def register_color
    @poster = Poster.find(params[:id])
    save_colors(@poster)
    redirect_to admin_poster_path(@poster), notice: t('messages.rooms.register_color_success')
  end

  def edit; end

  def update
    if @poster.update(poster_params)
      redirect_to admin_poster_path(@poster), notice: 'Poster was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @poster.destroy!
    redirect_to admin_posters_path, status: :see_other, notice: 'Poster was successfully deleted.'
  end

  private

  def save_colors(poster)
    relative_path = poster.image.url.sub(/^\//, '')
    image_path = Rails.root.join('public', relative_path).to_s
    colors = VisionService.detect_colors(image_path)

    colors.each do |color_data|
      color = Color.find_or_create_by(hex: color_data[:hex], rgb: color_data[:rgb])
      PosterColor.create(poster: poster, color: color, pixel_fraction: color_data[:pixel_fraction])
    end
  end

  def set_poster
    @poster = Poster.find(params[:id])
  end

  def poster_params
    params.require(:poster).permit(
      :title,
      :image,
      :url,
      :height,
      :width,
      :price,
      :artist,
      :description
    )
  end
end
