class CreatePosterResults < ActiveRecord::Migration[7.0]
  def change
    create_table :poster_results do |t|
      t.references :category, null: false, foreign_key: true
      t.references :poster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
