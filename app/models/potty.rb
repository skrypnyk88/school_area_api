class Potty < ApplicationRecord
  attr_accessor :time, :potty_type
  enum potty_type: { wet_diaper: 0, bm_diaper: 1, 
                     wet_potty: 2, bm_potty: 3, dry: 4 }
  validates :time, :potty_type, presence: true
  validates_inclusion_of :potty_type, in: potty_types.keys, presence: true
end
