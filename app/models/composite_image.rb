class CompositeImage < ApplicationRecord
  mount_uploader :composite_image, CompositeImageUploader
  belongs_to :room
  belongs_to :user, optional: true
  belongs_to :poster

  require 'mini_magick'

  def self.create_composite(room_id, wallpaper_path, poster_path, poster_id, poster_width: 300, poster_height: 400)
    wallpaper = MiniMagick::Image.open(wallpaper_path)
    poster = MiniMagick::Image.open(poster_path)

    poster.resize "#{poster_width}x#{poster_height}"

    x_offset = (wallpaper.width - poster.width) / 2
    y_offset = (wallpaper.height - poster.height) / 2

    result = wallpaper.composite(poster) do |composite|
      composite.compose 'Over' # ポスターを壁紙の上に重ねる
      composite.geometry "+#{x_offset}+#{y_offset}" # ポスターの位置を指定
    end

    temp_file = Tempfile.new(['result', '.jpg'])
    result.write(temp_file.path)
    # CarrierWaveを使って加工した画像を保存
    composite_image =new(room_id: room_id, poster_id: poster_id)
    composite_image.composite_image = temp_file
    composite_image.save!

    # Tempfileを閉じて削除
    temp_file.close
    temp_file.unlink
  end
end
