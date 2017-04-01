class CreatePottyReports < ActiveRecord::Migration[5.0]
  def change
    create_table :potty_reports do |t|
    	t.date :day

    	t.timestamps
    end
    add_index :potty_reports, :day
  end
end
