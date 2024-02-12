class AddSessionIdToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :session_id, :string
  end
end
