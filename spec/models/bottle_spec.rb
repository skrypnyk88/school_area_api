require 'rails_helper'

RSpec.describe Bottle, type: :model do
  describe '#quantity' do
    context 'when numbers' do
      it 'is valid' do
        expect(build(:bottle, quantity: '130')).to be_valid
      end
    end
  end

  describe '#time' do
    context 'when not empty' do
      it 'is valid' do
        expect(build(:bottle, time: DateTime.now)).to be_valid
      end
    end

    context 'when correct format' do
      it 'is valid' do
        expect(build(:bottle, time: DateTime.now)).to be_valid
      end
    end
  end

  describe '#uom' do
    context 'when correct' do
      it 'is valid' do
        expect(build(:bottle, uom: 'ml')).to be_valid
      end
    end

    context 'when correct' do
      it 'is valid' do
        expect(build(:bottle, uom: 'oz')).to be_valid
      end
    end
  end
end
