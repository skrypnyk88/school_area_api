class Bottle < ApplicationRecord
  belongs_to :bottle_report

  before_validation :set_default_params, on: [:create]

  enum uom: { ml: 0, oz: 1 }

  validates :quantity,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :time, presence: true
  validates_inclusion_of :uom, in: uoms.keys

  def time_formated
    time.strftime('%H:%M')
  end

  private

  def set_default_params
    self.time ||= DateTime.now
    self.quantity ||= 30
    self.uom ||= 'ml'
  end
end
