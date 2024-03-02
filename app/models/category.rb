class Category < ApplicationRecord
  has_many :poster_results
  has_many :user_results
end
