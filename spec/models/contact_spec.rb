require 'rails_helper'

RSpec.describe Contact, type: :model do
    it 'is valid with valid attributes' do
      contact = build(:contact)
      expect(contact).to be_valid
    end
  
    it 'is invalid without a name' do
      contact = build(:contact, name: nil)
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
    end
  
    it 'is invalid without an email' do
      contact = build(:contact, email: nil)
      contact.valid?
      expect(contact.errors[:email]).to include("を入力してください")
    end
  
    it 'is invalid without a subject' do
      contact = build(:contact, subject: nil)
      contact.valid?
      expect(contact.errors[:subject]).to include("を入力してください")
    end
  
    it 'is invalid without a message' do
      contact = build(:contact, message: nil)
      contact.valid?
      expect(contact.errors[:message]).to include("を入力してください")
    end
  end