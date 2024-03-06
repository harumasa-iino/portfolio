class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_results
  after_save :update_user_result, if: -> { question_id == Question.last.id }

  def self.extract_bit_pattern(session_id)
    answers = Answer.where(session_id:)
                    .order(:question_id)
                    .group_by(&:question_id)
                    .values.map { |group| group.last }

    options = answers.map(&:option)
    binary_string = options.join
  end

  def update_user_result
    UserResult.update_from_answer(session_id)
  end
end
