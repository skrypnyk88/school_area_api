class MyDayReport < ApplicationRecord
  validates :day, presence: true
  validates :note, presence: true,
  length: { in: 2..1000, too_long: '1000 characters is the maximum allowed' }
end
