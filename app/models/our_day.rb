class OurDay < ApplicationRecord
  belongs_to :group

  validates :description, length: { in: 1..1000 }
  validates :day, presence: true
end
