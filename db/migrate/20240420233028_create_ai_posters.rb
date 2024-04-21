class CreateAiPosters < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_posters do |t|
      t.string :image
      t.text :revised_prompt
      t.integer :session_id

      t.timestamps
    end
  end
end
