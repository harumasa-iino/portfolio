require 'rails_helper'

RSpec.describe Poster, type: :model do
  let(:poster) { build(:poster) }

  it 'is valid with valid attributes' do
    poster = build(:poster)
    expect(poster).to be_valid
  end

  it 'is invalid without an image' do
    poster = build(:poster, image: nil)
    poster.valid?
    expect(poster.errors[:image]).to include('を入力してください')
  end

  it 'is invalid without a url' do
    poster = build(:poster, url: nil)
    poster.valid?
    expect(poster.errors[:url]).to include('を入力してください')
  end

  it 'is invalid without a title' do
    poster = build(:poster, title: nil)
    poster.valid?
    expect(poster.errors[:title]).to include('を入力してください')
  end

  it 'is invalid without a height' do
    poster = build(:poster, height: nil)
    poster.valid?
    expect(poster.errors[:height]).to include('を入力してください')
  end

  it 'is invalid without a width' do
    poster = build(:poster, width: nil)
    poster.valid?
    expect(poster.errors[:width]).to include('を入力してください')
  end
end
