class RemoveNameAddPatternToCategories < ActiveRecord::Migration[7.0]
  def up
    # nameカラムを削除
    remove_column :categories, :name, :string

    # patternカラムを追加
    add_column :categories, :pattern, :integer
  end

  def down
    # ロールバックが必要な場合の処理
    remove_column :categories, :pattern
    add_column :categories, :name, :string
  end
end
