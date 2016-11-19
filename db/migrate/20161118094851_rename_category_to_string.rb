class RenameCategoryToString < ActiveRecord::Migration[5.0]
  # rename需要用up down 不然rails db:rollback會有錯
  def up
    rename_column :information, :category_id, :category
    change_column :information, :category, :string ,:default => 'none'
  end
  def down
    change_column :information, :category_id, :ingeger
    rename_column :information, :category, :category_id
  end
end
