class CreateCurrentEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :user_id
      t.string :company
      t.string :title
      t.boolean :current
    end
  end
end
