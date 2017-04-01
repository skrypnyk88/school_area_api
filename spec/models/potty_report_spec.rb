require 'rails helper'

RSpec.describe PottyReport , type: :model do
 describe '#day' do
	context 'when day is not blank' do
	  it 'is valid' do
		expect(build(:potty_report, day: "Mon,25 Sep 2017").to be_valid
	  end
	end
	context 'when day is blank' do
		it 'is not valid' do
			expect(build(:potty_report, day: "").to_not be_valid
		end
	end
	end
end