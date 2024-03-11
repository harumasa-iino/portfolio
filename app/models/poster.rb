class Poster < ApplicationRecord
  mount_uploader :image, PosterUploader
  has_many :poster_answers, dependent: :destroy
  has_many :poster_results, dependent: :destroy
end
