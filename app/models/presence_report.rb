class PresenceReport < ApplicationRecord
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 48e10a96f8e73830c363cd8222bce553b6f884de
  belongs_to :student
  belongs_to :group
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
  has_many :report_times, as: :reportable

  validates :day, presence: true
=======
=======
  belongs_to :student
  belongs_to :group
>>>>>>> LVRUBYM-219: Fixed
=======

>>>>>>> LVRUBYM-219: add ReportTimesController
  validates :day, presence: true
  has_many :report_times, as: :reportable, dependent: :destroy
>>>>>>> LVRUBYM-192: Unit tests implementation
=======
>>>>>>> LVRUBYM-203: ReportTime model creation
=======
=======
  belongs_to :student
  belongs_to :group
>>>>>>> LVRUBYM-219: Fixed
  validates :day, presence: true
  has_many :report_times, as: :reportable, dependent: :destroy
>>>>>>> LVRUBYM-192: Unit tests implementation
end
