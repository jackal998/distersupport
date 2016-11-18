class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :paragraph


      t.timestamps
    end
  end
end
