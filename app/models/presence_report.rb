class PresenceReport < ApplicationRecord
  belongs_to :student
  belongs_to :group

  validates :day, presence: true
  has_many :report_times, as: :reportable
end
