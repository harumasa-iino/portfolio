class PosterAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :poster
end
