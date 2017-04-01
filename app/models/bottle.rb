class Bottle < ApplicationRecord
	belongs_to :bottle_report

	validates	:quantity, :time,
						presence: true
 	enum uom: { ml: 0, oz: 1}
end
