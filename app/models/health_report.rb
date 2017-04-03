class HealthReport < ApplicationRecord
  validates :health_note, length: { maximum: 250 }
  validates :special_care, inclusion: { in: [ true, false ] }
  validates :day, presence: true
end
