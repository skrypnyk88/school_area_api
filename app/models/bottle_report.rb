class BottleReport < ApplicationRecord
	has_many :bottles , foreign_key: 'bottle_report_id', dependent: :destroy
	  
	validates :day,
						presence: true
end
