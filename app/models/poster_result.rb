class PosterResult < ApplicationRecord
  belongs_to :category
  belongs_to :poster
  validates :category_id, :poster_id, presence: true

  def self.update_from_answer(poster_id)
    bit_pattern = PosterAnswer.extract_bit_pattern(poster_id)
    category = Category.find_by(pattern: bit_pattern)

    return unless category 

    # PosterResultに登録
    result = PosterResult.new(
      poster_id:,
      category_id: category.id
    )
    result.save!
  end
end
