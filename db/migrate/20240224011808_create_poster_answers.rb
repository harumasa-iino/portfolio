class CreatePosterAnswers < ActiveRecord::Migration[7.0]
  def change
    return if table_exists?(:poster_answers)

    create_table :poster_answers do |t|
      t.integer :option
      t.references :question, null: false, foreign_key: true
      t.references :poster, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :poster_answers, :questions, column: :question_id
    add_foreign_key :poster_answers, :posters, column: :poster_id
  end
end
