class ChangeEducationsDateToDatetime < ActiveRecord::Migration
  def change
    change_column :educations, :degree_date, :datetime
  end
end
