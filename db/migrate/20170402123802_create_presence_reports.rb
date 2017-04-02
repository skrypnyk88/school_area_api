class CreatePresenceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :presence_reports do |t|

      t.timestamps
    end
  end
end
