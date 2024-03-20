require 'rails_helper'

RSpec.describe CompositeImage, type: :model do
  it 'is valid with valid attributes' do
    room = create(:room)
    user = create(:user)
    poster = create(:poster)
    composite_image = build(:composite_image, room:, user:, poster:)

    # ここで、composite_image属性にファイルをアタッチします。
    composite_image.composite_image = Rack::Test::UploadedFile.new(
      Rails.root.join('spec/fixtures/files/sample_image.png'), 'image/png'
    )

    expect(composite_image).to be_valid
  end
end
