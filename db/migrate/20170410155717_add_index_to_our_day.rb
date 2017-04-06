class AddIndexToOurDay < ActiveRecord::Migration[5.0]
  def change
    add_index :our_days, :day
  end
end
