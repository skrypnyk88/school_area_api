class PresenceReport < ApplicationRecord
<<<<<<< 48e10a96f8e73830c363cd8222bce553b6f884de
  belongs_to :student
  belongs_to :group
  has_many :report_times, as: :reportable

  validates :day, presence: true
=======
  validates :day, presence: true
  has_many :report_times, as: :reportable, dependent: :destroy
>>>>>>> LVRUBYM-192: Unit tests implementation
end
