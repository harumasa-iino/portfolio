FactoryBot.define do
  factory :user_result do
    category
    session_id { Faker::Internet.uuid }
  end
end
