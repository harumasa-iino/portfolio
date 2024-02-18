class ChangeSessionIdTypeInAnswers < ActiveRecord::Migration[7.0]
  def change
    change_column :answers, :session_id, :string
  end
end
