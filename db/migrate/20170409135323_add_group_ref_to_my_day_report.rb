class AddGroupRefToMyDayReport < ActiveRecord::Migration[5.0]
  def change
    remove_column :my_day_reports, :group_id, :integer
    add_reference :my_day_reports, :group, index: true, foreign_key: true
  end
end
