class Answer < ApplicationRecord
  belongs_to :question
  after_save :update_user_result

  def self.extract_bit_pattern(session_id)
    options = where(session_id_id: session_id).order(:question_id).pluck(:option)
    options.inject(0) { |acc, option| (acc << 1) | option }
  end

  def update_user_result
    UserResult.update_from_answer(self.session_id) 
  end
end
