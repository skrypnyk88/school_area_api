class OurDay < ApplicationRecord
  belongs_to :group

  validates :description, length: { maximum: 1000 }
  validates :day, presence: true
end
