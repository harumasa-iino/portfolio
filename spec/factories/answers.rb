FactoryBot.define do
  factory :answer do
    option { Faker::Number.between(from: 0, to: 1) }
    association :question
    session_id { Faker::Internet.uuid }
  end
end
