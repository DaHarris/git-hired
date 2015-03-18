class CreateLookingFor < ActiveRecord::Migration
  def change
    create_table :looking_fors do |t|
      t.integer :user_id
      t.string :quality
      t.string :language
      t.string :location
    end
  end
end
