class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.text :first_option
      t.text :second_option

      t.timestamps
    end
  end
end
