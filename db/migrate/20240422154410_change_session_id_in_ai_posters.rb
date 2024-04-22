class ChangeSessionIdInAiPosters < ActiveRecord::Migration[7.0]
  def change
    change_column :ai_posters, :session_id, :string
  end
end
