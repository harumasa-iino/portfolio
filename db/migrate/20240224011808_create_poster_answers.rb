class CreatePosterAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :poster_answers do |t|
      t.integer :option
      t.references :question, null: false, foreign_key: true
      t.references :poster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
