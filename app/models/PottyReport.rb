class PottyReport < ApplicationRecord
	attr_accessor :day
	validates :day, presence: true
end