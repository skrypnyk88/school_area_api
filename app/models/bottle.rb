class Bottle < ApplicationRecord
  belongs_to :bottle_report
  enum uom: { ml: 0, oz: 1 }
  validates :quantity,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :time,
            presence: true
  validates_inclusion_of :uom, in: uoms.keys
end
