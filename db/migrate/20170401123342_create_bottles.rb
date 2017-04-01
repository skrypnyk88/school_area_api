class CreateBottles < ActiveRecord::Migration[5.0]
  def change
    create_table :bottles do |t|
      t.float :quantity
      t.datetime :time
      t.integer :uom
      t.integer :botlle_report_id

      t.timestamps
    end
  end
end
