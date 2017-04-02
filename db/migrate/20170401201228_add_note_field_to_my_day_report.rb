class AddNoteFieldToMyDayReport < ActiveRecord::Migration[5.0]
  def change
    change_table :my_day_reports do |t|
      t.text :note
    end
  end
end
