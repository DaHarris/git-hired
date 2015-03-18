class AddAvatarToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :avatar, :string
  end
end
