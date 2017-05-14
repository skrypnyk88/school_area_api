class CreateOurDays < ActiveRecord::Migration[5.0]
  def change
    create_table :our_days do |t|
      t.text :description
      t.date :day

      t.timestamps
    end
  end
end
