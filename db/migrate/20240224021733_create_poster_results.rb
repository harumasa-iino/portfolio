class CreatePosterResults < ActiveRecord::Migration[7.0]
  def change
    return if table_exists?(:poster_results)

    create_table :poster_results do |t|
      t.integer :category_id
      t.integer :poster_id

      t.timestamps
    end

    add_foreign_key :poster_results, :categories, column: :category_id
  end
end
