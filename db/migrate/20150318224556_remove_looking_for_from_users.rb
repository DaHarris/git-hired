class RemoveLookingForFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :looking_for, :string
  end
end
