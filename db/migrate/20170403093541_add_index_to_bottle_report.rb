class AddIndexToBottleReport < ActiveRecord::Migration[5.0]
  def change
    add_index :bottle_reports, :day
  end
end
