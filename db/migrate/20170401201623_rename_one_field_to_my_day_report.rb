class RenameOneFieldToMyDayReport < ActiveRecord::Migration[5.0]
  def change
    change_table :my_day_reports do |t|
      t.rename :school_class_id, :group_id
    end
  end
end
