class Bottle < ApplicationRecord
  belongs_to :bottle_report
  validates :quantity,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :time,
            presence: true
  validates :uom, inclusion: { in: %w(ml oz) }
  enum uom: { ml: 0, oz: 1 }
end
