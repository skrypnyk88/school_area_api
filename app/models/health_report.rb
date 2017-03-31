class HealthReport < ApplicationRecord
  validates :health_note, length: { maximum: 250 }
  validates_inclusion_of :special_care, in: [true, false]
end
