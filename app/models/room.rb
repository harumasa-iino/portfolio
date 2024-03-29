class Room < ApplicationRecord
  has_many :room_colors
  has_many :colors, through: :room_colors
  mount_uploader :image, InteriorUploader
  attr_accessor :image_cache

  validates :image, presence: true
end
