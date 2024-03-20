FactoryBot.define do
    factory :room do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample_room_image.png'), 'image/png') }
      image_cache { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample_room_image.png'), 'image/png') }
      session_id { Faker::Internet.uuid }
    end
  end