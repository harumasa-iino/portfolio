class AiCompositeImagesController < ApplicationController
  before_action :set_room, only: %i[index show create]

  def index
    @ai_image = AiPoster.where(session_id: @session_id).last
    @error = session[:error]
    create_composite_image(@ai_image)
  end

  def create
    prompt = "Generate either a poster, painting or photo. I'll leave the theme to you."
    response = OpenAiService.generate_image(prompt)

    if response.key?("error")
      session[:error] = response["error"]
    else
      image_url = response["data"][0]["url"]
      revised_prompt = response["data"][0]["revised_prompt"]

      ai_poster = AiPoster.new
        if ai_poster.save_image_and_data(image_url, revised_prompt, @session_id)
          session[:error] = nil
        else
          session[:error] = "Failed to create Ai Poster"
        end
      
    end

    redirect_to ai_composite_images_path
  end

  def show
    @composite_image = session[:ai_image]
  end

  private

  def create_composite_image(ai_image)
    @composite_image = CompositeImage.create_composite(@room.id, @room.image.path, ai_image.image.path, nil, 527, 527, @room.x_coordinate, @room.y_coordinate)
    session[:ai_image] = @composite_image
  end

  def set_room
    @session_id = session[:session_id]
    @room = Room.where(session_id: @session_id).order(:created_at).last
  end
end
