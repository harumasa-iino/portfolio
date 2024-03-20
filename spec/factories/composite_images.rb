FactoryBot.define do
    factory :composite_image do
      association :room
      composite_image { Faker::Lorem.word }
      association :user
      association :poster
    end
  end