require 'rails_helper'

require 'rails_helper'

RSpec.describe PosterAnswer, type: :model do
  # 有効な属性を持つ PosterAnswer は有効である
  it 'is valid with valid attributes' do
    question = create(:question)
    poster = create(:poster)
    poster_answer = build(:poster_answer, question: question, poster: poster)
    expect(poster_answer).to be_valid
  end

  # option が nil の場合は無効である
  it 'is invalid without an option' do
    poster_answer = build(:poster_answer, option: nil)
    poster_answer.valid?
    expect(poster_answer.errors[:option]).to include("を入力してください")
  end

  # Question に属している
  it 'belongs to a question' do
    question = create(:question)
    poster_answer = create(:poster_answer, question: question)
    expect(poster_answer.question).to eq(question)
  end

  # Poster に属している
  it 'belongs to a poster' do
    poster = create(:poster)
    poster_answer = create(:poster_answer, poster: poster)
    expect(poster_answer.poster).to eq(poster)
  end
end
