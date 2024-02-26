class UserResult < ApplicationRecord
  belongs_to :category

  def self.update_from_answer(session_id)
    bit_pattern = Answer.extract_bit_pattern(session_id)
    category_id = Category.patterns.key(bit_pattern)

    # UserResultに登録 
    result = UserResult.new(
    session_id: session_id,
    category_id: category_id
    )
    result.save!
end
end
