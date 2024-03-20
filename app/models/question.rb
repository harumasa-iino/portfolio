class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :poster_answers, dependent: :destroy
  validates :body, :first_option, :second_option, presence: true
end
