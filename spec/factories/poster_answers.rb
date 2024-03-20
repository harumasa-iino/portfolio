FactoryBot.define do
    factory :poster_answer do
      option { Faker::Number.between(from: 1, to: 2) }
      question
      poster
    end
  end
  