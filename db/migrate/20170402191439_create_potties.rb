class CreatePotties < ActiveRecord::Migration[5.0]
  def change
    create_table :potties do |t|
      t.datetime :time
      t.integer :potty_type

      t.timestamps
    end
    add_index :potties, :potty_report_id
  end
end
