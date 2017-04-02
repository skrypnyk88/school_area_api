class PresenceReport < ApplicationRecord
  validates :day, presence: true
  has_many :report_times, as: :reportable, dependent: :destroy
end
