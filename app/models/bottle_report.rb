class BottleReport < ApplicationRecord
  has_many :bottles, dependent: :destroy
  belongs_to :group
  belongs_to :student

  validates :day,
            presence: true
end
