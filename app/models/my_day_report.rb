class MyDayReport < ApplicationRecord
  validates :day, presence: true
  validates :note,
            presence: true,
            length: {
              in: 2..1000,
              too_long: '%{count} characters is the maximum allowed',
              too_short: '%{count} characters is the minimum allowed'
            }
end
