class CreatePresenceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :presence_reports do |t|
<<<<<<< b65e4a29b844cb164727aae68d6b9ad169158d53
      t.date     :day
      t.integer  :updated_by

      t.timestamps
    end
    add_reference :presence_reports, :group, index: true, foreign_key: true
    add_reference :presence_reports, :student, index: true, foreign_key: true
=======

      t.timestamps
    end
>>>>>>> LVRUBYM-203: ReportTime model creation
  end
end
