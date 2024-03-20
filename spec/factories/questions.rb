FactoryBot.define do
    factory :question do
      body { Faker::Lorem.sentence }
      first_option { Faker::Lorem.sentence }
      second_option { Faker::Lorem.sentence }
    end
  end