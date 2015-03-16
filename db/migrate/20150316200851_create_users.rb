class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :linkedin_id
      t.string :email
      t.string :twitter
      t.string :github
      t.integer :phone
      t.string :bio
    end
  end
end
