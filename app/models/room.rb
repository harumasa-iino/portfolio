class Room < ApplicationRecord
  mount_uploader :image, InteriorUploader
  attr_accessor :image_cache
end
