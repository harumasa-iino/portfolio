class AddUserIdToCompositeImages < ActiveRecord::Migration[7.0]
  def change
    add_column :composite_images, :user_id, :integer
    add_index :composite_images, :user_id
  end
end
