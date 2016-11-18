class CreateInformationComments < ActiveRecord::Migration[5.0]
  def change
    create_table :information_comments do |t|
      t.integer :user_id
      t.integer :information_id
      t.string :title
      t.string :paragraph

      t.timestamps
    end
  end
end
