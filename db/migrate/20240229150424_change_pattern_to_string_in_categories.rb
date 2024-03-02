class ChangePatternToStringInCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :pattern, :string
  end
end
