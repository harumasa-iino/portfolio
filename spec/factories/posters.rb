FactoryBot.define do
  factory :poster do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample_image.png'), 'image/png') }
    url { Faker::Internet.url }
    title { Faker::Lorem.sentence }
    height { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    width { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    price { Faker::Number.number(digits: 4) }
    artist { Faker::Name.name }
    description { Faker::Lorem.paragraph }
  end
end
