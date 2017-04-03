class RemovePottyReportIdFromPotties < ActiveRecord::Migration[5.0]
  def change
  	remove_column :potties, :potty_report_id, :integer
  end
end
