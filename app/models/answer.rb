class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_results
  validates :question_id, presence: true
  validates :option, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

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
