require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  it 'is valid with valid attributes' do
    user = create(:user)
    sns_credential = build(:sns_credential, user:)
    expect(sns_credential).to be_valid
  end

  it 'is invalid without a provider' do
    sns_credential = build(:sns_credential, provider: nil)
    sns_credential.valid?
    expect(sns_credential.errors[:provider]).to include('を入力してください')
  end

  it 'is invalid without a uid' do
    sns_credential = build(:sns_credential, uid: nil)
    sns_credential.valid?
    expect(sns_credential.errors[:uid]).to include('を入力してください')
  end

  it 'belongs to a user' do
    sns_credential = create(:sns_credential)
    expect(sns_credential.user).to be_a(User)
  end
end
