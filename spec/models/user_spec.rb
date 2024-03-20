require 'rails_helper'

RSpec.describe User, type: :model do
  # メールアドレスのバリデーションテスト
  it 'is valid with a valid email' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(email: nil, password: 'password')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    User.create(email: 'test@example.com', password: 'password')
    user = User.new(email: 'test@example.com', password: 'password')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  # パスワードのバリデーションテスト
  it 'is invalid without a password' do
    user = User.new(email: 'test@example.com', password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end
