class CreatePosterColors < ActiveRecord::Migration[7.0]
  def change
    create_table :poster_colors do |t|
      t.references :poster, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.float :pixel_fraction

      t.timestamps
    end
  end
end
