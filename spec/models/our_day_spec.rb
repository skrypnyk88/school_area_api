require 'rails_helper'

RSpec.describe OurDay, type: :model do
  describe '#our_day' do
    context 'when our_day is good' do
      it 'should valid' do
        expect(build(:group)).to be_valid
      end
    end
  end
end