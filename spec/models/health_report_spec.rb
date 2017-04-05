require 'rails_helper'

RSpec.describe HealthReport, type: :model do
  describe '#health_report' do
    context 'when data is valid' do
      it 'is valid' do
        expect(build(:health_report)).to be_valid
      end
    end
  end
  describe '#health note' do
    context 'when length <= 250 char' do
      it 'is valid' do
        expect(build(:health_report, health_note: 'a' * 249)).to be_valid
      end
    end

    context 'when health note = nil' do
      it 'is valid' do
        expect(build(:health_report, health_note: nil)).to be_valid
      end
    end

    context 'when length >= 250 char' do
      it 'is not valid' do
        expect(build(:health_report, health_note: 'a' * 251)).to_not be_valid
      end
    end
  end

  describe '#special care' do
    context 'when special_care = true' do
      it 'is valid' do
        expect(build(:health_report, special_care: true)).to be_valid
      end
    end

    context 'when special_care = false' do
      it 'is valid' do
        expect(build(:health_report, special_care: false)).to be_valid
      end
    end

    context 'when special_care = nil' do
      it 'is not valid' do
        expect(build(:health_report, special_care: nil)).to_not be_valid
      end
    end
  end

  describe '#day' do
    context 'when day is valid' do
      it 'is valid' do
        expect(build(:health_report, day: '21.10.2000')).to be_valid
      end
    end

    context 'when day is nil' do
      it 'is not valid' do
        expect(build(:health_report, day: nil)).to_not be_valid
      end
    end

    context 'when day = day' do
      it 'is not valid' do
        expect(build(:health_report, day: 'day')).to_not be_valid
      end
    end
  end
end
