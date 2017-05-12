class MyDayReport < ApplicationRecord
  belongs_to :group
  belongs_to :student

  validates :day, presence: true
  validates :note,
            presence: true,
            allow_nil: true,
            length: { in: 2..1000 }
end
