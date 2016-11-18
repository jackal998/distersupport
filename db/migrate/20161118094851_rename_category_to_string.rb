class RenameCategoryToString < ActiveRecord::Migration[5.0]
  def change
    rename_column :information, :category_id, :category
    change_column :information, :category, :string
  end
end
