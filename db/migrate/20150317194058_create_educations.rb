class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :user_id
      t.string :field_of_study
      t.string :degree
      t.date :degree_date
      t.string :school
    end
  end
end
