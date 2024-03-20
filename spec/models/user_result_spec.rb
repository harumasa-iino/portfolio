require 'rails_helper'

RSpec.describe UserResult, type: :model do
  it 'belongs to a category' do
    user_result = create(:user_result)
    expect(user_result.category).to be_a(Category)
  end
end
