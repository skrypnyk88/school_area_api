require 'rails_helper'

RSpec.describe ReportTime, type: :model do
  describe '#start_time' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:presence_report, day:nil)).to_not be_valid
      end
    end

    context 'when not empty' do
      it 'is valid' do
        expect(build(:presence_report, day:'2017-01-11')).to be_valid
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
        expect(build(:presence_report, day:'20 2017 April')).to_not be_valid
      end
    end
  end

  describe '#end_time' do

    context 'when not empty' do
      it 'is valid' do
        expect(build(:presence_report, day:'2017-01-11')).to be_valid
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
        expect(build(:presence_report, day:'20 2017 April')).to_not be_valid
      end
    end
  end
end
