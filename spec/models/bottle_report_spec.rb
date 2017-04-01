require 'rails_helper'

RSpec.describe BottleReport, type: :model do
  describe '#day' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:bottle_report, day:nil)).to_not be_valid
      end
    end

    context 'when not empty' do
      it 'is valid' do
        expect(build(:bottle_report, day:'2017-05-19')).to be_valid
      end
    end

    context 'when incorrect format' do
      it 'is invalid' do
        expect(build(:bottle_report, day:'10,06,2017')).to_not be_valid
      end
    end
  end
end
