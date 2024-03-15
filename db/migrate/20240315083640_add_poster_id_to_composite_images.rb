class AddPosterIdToCompositeImages < ActiveRecord::Migration[7.0]
  def change
    add_column :composite_images, :poster_id, :integer
  end
end
