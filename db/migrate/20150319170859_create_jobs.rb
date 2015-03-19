class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :location
      t.string :link
      t.integer :user_id
      t.timestamp :created_at
    end
  end
end
