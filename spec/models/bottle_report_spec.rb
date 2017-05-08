require 'rails_helper'

RSpec.describe BottleReport, type: :model do
  describe '#day' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:bottle_report, day: nil)).to_not be_valid
      end
    end

    context 'when not empty' do
      it 'is valid' do
        expect(build(:bottle_report, day: Date.today)).to be_valid
      end
    end

    context 'when correct format' do
      it 'is valid' do
        expect(build(:bottle_report, day: Date.today)).to be_valid
      end
    end
  end
end
