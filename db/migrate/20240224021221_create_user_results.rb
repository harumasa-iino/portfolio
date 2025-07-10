class CreateUserResults < ActiveRecord::Migration[7.0]
  def change
    create_table :user_results do |t|
      t.references :category, null: false, foreign_key: true
      t.integer :session_id

      t.timestamps
    end
  end
end
