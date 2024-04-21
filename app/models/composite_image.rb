class CompositeImage < ApplicationRecord
  mount_uploader :composite_image, CompositeImageUploader
  belongs_to :room
  belongs_to :user, optional: true
  belongs_to :poster, optional: true
  validates :room_id, :composite_image, presence: true

  require 'mini_magick'

  def self.create_composite(room_id, wallpaper_path, poster_path, poster_id, poster_width, poster_height, x_percent, y_percent)
    wallpaper = MiniMagick::Image.open(wallpaper_path)
    poster = MiniMagick::Image.open(poster_path)

    poster.resize "#{poster_width}x#{poster_height}"

    # パーセンテージからピクセル値に変換
    x_offset = (wallpaper.width * x_percent.to_f / 100) - (poster.width / 2)
    y_offset = (wallpaper.height * y_percent.to_f / 100) - (poster.height / 2)

    result = wallpaper.composite(poster) do |composite|
      composite.compose 'Over' # ポスターを壁紙の上に重ねる
      composite.geometry "+#{x_offset.to_i}+#{y_offset.to_i}" # ポスターの位置をピクセル単位で指定
    end

    temp_file = Tempfile.new(['result', '.jpg'])
    result.write(temp_file.path)

    # CarrierWaveを使って加工した画像を保存
    composite_image = new(room_id: room_id, poster_id: poster_id)
    composite_image.composite_image = temp_file
    composite_image.save!

    # Tempfileを閉じて削除
    temp_file.close
    temp_file.unlink

    composite_image
  end
end
