require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  describe 'GET /new' do
    it 'accesses the new page and displays the correct content' do
      get new_room_path
      expect(response.status).to eq(200)
      expect(response.body).to include('インテリアのアップロード')
      expect(response.body).to include('画像をアップロードする')
    end
  end

  describe 'POST /rooms' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          room: {
            image: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'sample_room_image.png'),
                                       'image/png')
          }
        }
      end

      it 'creates a new Room and redirects to the show page' do
        expect do
          post rooms_path, params: valid_attributes
        end.to change(Room, :count).by(1)

        expect(response).to redirect_to(room_path(Room.last))
        follow_redirect!

        expect(response.body).to include('アップロードした画像')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          room: {
            image: nil
          }
        }
      end

      it 'does not create a new Room and re-renders the new template' do
        post rooms_path, params: invalid_attributes

        expect(Room.count).to eq(0)
        expect(response.body).to include('インテリアのアップロード')
        expect(response.body).to include('画像をアップロードする')
      end
    end
  end
end
