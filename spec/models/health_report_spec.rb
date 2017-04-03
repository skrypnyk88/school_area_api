require 'rails_helper'

RSpec.describe HealthReport, type: :model do
  describe 'Validation of HealthReport' do
    context 'when peport is valid' do

      it 'be valid if all value is valid' do
        expect(build(:health_report)).to be_valid
      end

      it 'be valid if length of health note is less then 250 char' do
        expect(build(:health_report, health_note: 'a'*249)).to be_valid
      end

      it 'be valid if special_care = true' do
        expect(build(:health_report, special_care: true)).to be_valid
      end

      it 'be valid if date be valid' do
        expect(build(:health_report, day: '21.10.2000')).to be_valid
      end

      it 'be valid if special_care = false' do
        expect(build(:health_report, special_care: false)).to be_valid
      end
    end

    context 'when report is invalid' do
      it 'be invalid if length of health note is less then 250 char' do
        expect(build(:health_report, health_note: 'a'*251)).to_not be_valid
      end

      it 'be invalid if some value is invalid' do
        expect(build(:health_report, special_care: nil)).to_not be_valid
      end

      it 'be invalid if date be nil' do
        expect(build(:health_report, day: nil)).to_not be_valid
      end

      it 'be invalid if date be string' do
        expect(build(:health_report, day: "Some string")).to_not be_valid
      end
    end
  end
end
