class Poster < ApplicationRecord
  mount_uploader :image, PosterUploader
  has_many :poster_answers, dependent: :destroy
  has_many :poster_results, dependent: :destroy
  has_many :poster_colors, dependent: :destroy
  has_many :colors, through: :poster_colors

  validates :image, :url, :title, :height, :width, presence: true
  validates :height, :width, numericality: true
end
