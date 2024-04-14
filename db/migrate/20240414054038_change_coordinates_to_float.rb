class ChangeCoordinatesToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :x_coordinate, :float
    change_column :rooms, :y_coordinate, :float
  end
end
