class PosterAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :poster
  validates :question_id, :poster_id, presence: true
  after_save :update_poster_result, if: -> { question_id == Question.last.id }

  def registered?(poster_id)
    self.class.exists?(poster_id:)
  end

  def self.extract_bit_pattern(poster_id)
    options = where(poster_id:).order(:question_id).pluck(:option)
    binary_string = options.join
  end

  def update_poster_result
    PosterResult.update_from_answer(poster_id)
  end
end
