class Admin::PostersController < Admin::BaseController
  def new
    @poster = Poster.new
  end

  def create
      @poster = Poster.new(poster_params)
    
      if @poster.save
        redirect_to new_admin_posters_path, notice: 'Posterが正常に作成されました。'
      else
        render :new
      end
    end
    
    private
    
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
