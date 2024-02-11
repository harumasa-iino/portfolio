# frozen_string_literal: true

class Room < ApplicationRecord
  mount_uploader :image, InteriorUploader
  attr_accessor :image_cache
end
