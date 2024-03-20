require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'is valid with a body and options' do
    question = build(:question)
    expect(question).to be_valid
  end

  it 'is invalid without a body' do
    question = build(:question, body: nil)
    question.valid?
    expect(question.errors[:body]).to include('を入力してください')
  end

  it 'is invalid without a first_option' do
    question = build(:question, first_option: nil)
    question.valid?
    expect(question.errors[:first_option]).to include('を入力してください')
  end

  it 'is invalid without a second_option' do
    question = build(:question, second_option: nil)
    question.valid?
    expect(question.errors[:second_option]).to include('を入力してください')
  end
end
