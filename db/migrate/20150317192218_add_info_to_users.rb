class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :picture_url, :string
    add_column :users, :email, :string
    add_column :users, :description, :string
  end
end
