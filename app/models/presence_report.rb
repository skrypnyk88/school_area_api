class PresenceReport < ApplicationRecord
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 48e10a96f8e73830c363cd8222bce553b6f884de
  belongs_to :student
  belongs_to :group
  has_many :report_times, as: :reportable

  validates :day, presence: true
=======
=======
  belongs_to :student
  belongs_to :group
>>>>>>> LVRUBYM-219: Fixed
  validates :day, presence: true
  has_many :report_times, as: :reportable, dependent: :destroy
>>>>>>> LVRUBYM-192: Unit tests implementation
end
