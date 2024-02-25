class PosterAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :poster

  def registered?(poster_id)
    self.class.exists?(poster_id: poster_id)
  end
end
