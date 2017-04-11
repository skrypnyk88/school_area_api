require 'rails_helper'

RSpec.describe MyDayReport, type: :model do
  describe '#day' do
    context 'when empty field' do
      it 'is invalid' do
        expect(build(:my_day_report, day: nil)).to_not be_valid
      end
    end

    context 'when not empty field' do
      it 'is valid' do
        expect(build(:my_day_report, day: '12.12.1212')).to be_valid
      end
    end
  end

  describe '#note' do
    context 'when note is too short' do
      it 'is invalid' do
        expect(build(:my_day_report, note: 'a')).to_not be_valid
      end
    end

    context 'when note in range' do
      it 'is valid' do
        expect(build(:my_day_report, note: 'a' * 50)).to be_valid
      end
    end

    context 'when note is too long' do
      it 'is invalid' do
        expect(build(:my_day_report, note: 'a' * 1001)).to_not be_valid
      end
    end
  end
end
