class PresenceReport < ApplicationRecord
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
end
