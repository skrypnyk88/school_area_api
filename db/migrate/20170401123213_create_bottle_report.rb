class CreateBottleReport < ActiveRecord::Migration[5.0]
  def change
    create_table :bottle_reports do |t|
      t.date :day

      t.timestamps
    end
  end
end
