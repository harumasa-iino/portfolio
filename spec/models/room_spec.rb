require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'is valid with an image' do
    room = build(:room)
    expect(room).to be_valid
  end

  it 'is invalid without an image' do
    room = build(:room, image: nil)
    room.valid?
    expect(room.errors[:image]).to include('を入力してください')
  end
end
