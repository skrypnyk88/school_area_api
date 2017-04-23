class AddDefaultValueToMyDayReport < ActiveRecord::Migration[5.0]
  def change
    change_column :my_day_reports, :note, :text, default: 'Empty'
  end
end
