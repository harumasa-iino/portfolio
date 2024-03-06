class CreateUserResults < ActiveRecord::Migration[7.0]
  def change
    return if table_exists?(:user_results)

    create_table :user_results do |t|
      t.integer :category_id
      t.integer :session_id

      t.timestamps
    end

    add_foreign_key :user_results, :categories, column: :category_id
  end
end
