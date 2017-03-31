class CreateHealthReports < ActiveRecord::Migration[5.0]
  def change
    create_table :health_reports do |t|
      t.boolean :special_care, default: false
      t.text :health_note

      t.timestamps
    end
  end
end
