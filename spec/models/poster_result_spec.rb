require 'rails_helper'

RSpec.describe PosterResult, type: :model do
  it 'belongs to a category' do
    poster_result = create(:poster_result)
    expect(poster_result.category).to be_a(Category)
  end

  it 'belongs to a poster' do
    poster_result = create(:poster_result)
    expect(poster_result.poster).to be_a(Poster)
  end
end
