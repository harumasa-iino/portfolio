class CreateCompositeImages < ActiveRecord::Migration[7.0]
  def change
    create_table :composite_images do |t|
      t.references :room, null: false, foreign_key: true
      t.string :composite_image

      t.timestamps
    end
  end
end
