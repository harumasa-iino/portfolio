class Color < ApplicationRecord
  has_many :room_colors
  has_many :rooms, through: :room_colors
  has_many :poster_colors
  has_many :posters, through: :poster_colors
end
