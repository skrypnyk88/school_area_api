require 'rails_helper'

RSpec.describe Potty, type: :model do
  describe '#time' do
    context 'when time is empty' do
      it 'is not valid' do
        expect(build(:potty, time: nil)).to_not be_valid
      end
    end

    context 'when time is not empty' do
      it 'is valid' do
        expect(build(:potty, time: '2017-08-01 12:20:03')).to be_valid
      end
    end
  end

  describe '#potty_type' do
    context 'when potty_type is empty' do
      it 'is not valid' do
        expect(build(:potty, potty_type: nil)).to_not be_valid
      end
    end

    context 'when potty_type is not empty' do
      it 'is valid' do
        expect(build(:potty, potty_type: 'dry')).to be_valid
      end
    end

    context 'when is from potty_type' do
      it 'is valid' do
        expect(build(:potty, potty_type: 'dry')).to be_valid
      end
    end
  end
end
