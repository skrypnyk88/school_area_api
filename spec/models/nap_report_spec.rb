require 'rails_helper'

RSpec.describe NapReport, type: :model do
  describe '#day' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:nap_report, day: nil)).to_not be_valid
      end
    end

    context 'when not empty' do
      it 'is valid' do
        expect(build(:nap_report, day: '2017-01-11')).to be_valid
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
        expect(build(:nap_report, day: '20 2017 April')).to_not be_valid
      end
    end
  end
end
