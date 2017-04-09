class CreateBottleReport < ActiveRecord::Migration[5.0]
  def change
    create_table :bottle_reports do |t|
      t.date :day
      t.integer :student_id
      t.integer :updated_by
      t.integer :group_id

      t.timestamps
    end
  end
end
