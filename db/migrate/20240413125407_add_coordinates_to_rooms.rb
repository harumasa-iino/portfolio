class AddCoordinatesToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :x_coordinate, :integer, default: 50
    add_column :rooms, :y_coordinate, :integer, default: 50
  end
end
