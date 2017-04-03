require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid arguments' do
    expect(build(:group)).to be_valid
  end

  describe 'Validations' do
    describe '#name' do
      context 'when empty' do
        it 'is invalid' do
          expect(build(:group, name: '')).to_not be_valid
        end
      end

      context 'when length > 20' do
        it 'is invalid' do
          expect(build(:group, name: 'a' * 21)).to_not be_valid
        end
      end

      context 'when does not match format' do
        it 'is invalid' do
          expect(build(:group, name: 'Group 7!')).to_not be_valid
        end
      end

      context 'when length <= 20' do
        it 'is valid' do
          expect(build(:group, name: 'A' * 20)).to be_valid
        end
      end

      context 'when matches format' do
        it 'is valid' do
          expect(build(:group, name: 'LV-Ruby 227')).to be_valid
        end
      end
    end
  end

  describe 'Associations' do
    it { should have_many(:students) }
  end

  describe 'Callbacks' do
    describe 'before_save' do
      it 'capitalize name' do
        group = create(:group, name: 'group 11')
        expect(group.name).to eq('Group 11')
      end
    end
  end
end
