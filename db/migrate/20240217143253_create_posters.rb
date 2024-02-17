class CreatePosters < ActiveRecord::Migration[7.0]
  def change
    create_table :posters do |t|
      t.string :image, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.float :height, null: false
      t.float :width, null: false
      t.integer :price
      t.string :artist
      t.text :description

      t.timestamps
    end
  end
end
