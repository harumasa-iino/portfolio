require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { create(:question) }

  it 'is valid with valid attributes' do
    answer = build(:answer, question:)
    expect(answer).to be_valid
  end

  it 'is invalid without an option' do
    answer = build(:answer, option: nil, question:)
    answer.valid?
  end

  it 'belongs to a question' do
    answer = create(:answer, question:)
    expect(answer.question).to eq(question)
  end
end
