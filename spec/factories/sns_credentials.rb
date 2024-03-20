FactoryBot.define do
    factory :sns_credential do
      provider { Faker::Lorem.word }
      uid { Faker::Internet.uuid }
      user
    end
  end