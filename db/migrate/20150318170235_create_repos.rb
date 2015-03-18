class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :user_id
      t.string :name
      t.string :url
      t.boolean :show, default: true
    end
  end
end
