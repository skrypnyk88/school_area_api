class CreatePresenceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :presence_reports do |t|
<<<<<<< f31edd1b9c125f751a7d416d9280fbc318167c67
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
      t.date     :day
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
      t.integer  :updated_by
=======
      t.integer  :updated_by    
>>>>>>> LVRUBYM-219: Fixed
=======
      t.integer  :updated_by
>>>>>>> LVRUBYM-219: add ReportTimesController
=======
      t.date :day
>>>>>>> LVRUBYM-193: PresentReport model creation

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
