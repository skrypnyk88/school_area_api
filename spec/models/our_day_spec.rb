require 'rails_helper'

RSpec.describe OurDay, type: :model do
  let(:group) { FactoryGirl.create :group }

  describe '#our_day' do
    context 'when our_day is good' do
      it 'should valid' do
        expect(build(:our_day, group: group)).to be_valid
      end
    end
  end

  describe '#description' do
    context 'when length more than 1000' do
      it 'should not valid' do
        expect(build(:our_day, description: 'a' * 1001)).to_not be_valid
      end
    end
  end
end
