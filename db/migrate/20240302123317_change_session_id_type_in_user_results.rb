class ChangeSessionIdTypeInUserResults < ActiveRecord::Migration[7.0]
  def change
    change_column :user_results, :session_id, :string
  end
end
