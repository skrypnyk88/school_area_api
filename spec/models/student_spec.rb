require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build(:student) }

  it 'is valid with valid arguments' do
    expect(build(:student)).to be_valid
  end

  describe '#age' do
    it 'calculates age based on birthdate' do
      student.birthdate = Date.today - 8.years
      expect(student.age).to be 8
    end
  end

  describe '#valid_age?' do
    context 'when age from 2 to 6' do
      it 'returns true' do
        student.birthdate = Date.today - 4.years
        expect(student.valid_age?).to be true
      end
    end

    context 'when age < 2' do
      it 'returns false' do
        student.birthdate = Date.tomorrow + 1 - 2.years
        expect(student.valid_age?).to be false
      end
    end

    context 'when age > 6' do
      it 'returns false' do
        student.birthdate = Date.yesterday - 1 - 7.years
        expect(student.valid_age?).to be false
      end
    end
  end

  describe 'Validations' do
    describe '#first_name' do
      context 'when empty' do
        it 'is invalid' do
          expect(build(:student, first_name: '')).to_not be_valid
        end
      end

      context 'when length > 20' do
        it 'is invalid' do
          expect(build(:student, first_name: 'a' * 21)).to_not be_valid
        end
      end

      context 'when does not match format' do
        it 'is invalid' do
          expect(build(:student, first_name: 'Ann 1*1')).to_not be_valid
        end
      end

      context 'when length <= 20' do
        it 'is valid' do
          expect(build(:student, first_name: 'A' * 20)).to be_valid
        end
      end

      context 'when matches format' do
        it 'is valid' do
          expect(build(:student, first_name: 'anna-maria')).to be_valid
        end
      end
    end

    describe '#last_name' do
      context 'when empty' do
        it 'is invalid' do
          expect(build(:student, last_name: '')).to_not be_valid
        end
      end

      context 'when length > 20' do
        it 'is invalid' do
          expect(build(:student, last_name: 'a' * 21)).to_not be_valid
        end
      end

      context 'when does not match format' do
        it 'is invalid' do
          expect(build(:student, last_name: 'Carter ()')).to_not be_valid
        end
      end

      context 'when length <= 20' do
        it 'is valid' do
          expect(build(:student, last_name: 'A' * 20)).to be_valid
        end
      end

      context 'when matches format' do
        it 'is valid' do
          expect(build(:student, last_name: 'stopford sackville')).to be_valid
        end
      end
    end

    describe '#birthdate' do
      context 'when empty' do
        it 'is invalid' do
          expect(build(:student, birthdate: nil)).to_not be_valid
        end
      end
    end

    describe '#gender' do
      context 'when male or female' do
        it 'is valid' do
          expect(build(:student, gender: :female)).to be_valid
        end
      end
    end

    describe '#age' do
      context 'when < 2' do
        it 'is invalid' do
          date = Date.tomorrow + 1 - 2.years
          expect(build(:student, birthdate: date)).to_not be_valid
        end
      end

      context 'when > 6' do
        it 'is invalid' do
          date = Date.yesterday - 1 - 7.years
          expect(build(:student, birthdate: date)).to_not be_valid
        end
      end

      context 'when from 2 to 6' do
        it 'is valid' do
          date = Date.today - 4.years
          expect(build(:student, birthdate: date)).to be_valid
        end
      end
    end
  end

  describe 'Associations' do
    it { should belong_to(:group) }
  end

  describe 'Callbacks' do
    describe 'before_save' do
      it 'titleize first name' do
        student = create(:student, first_name: 'merry jane')
        expect(student.first_name).to eq('merry jane'.titleize)
      end

      it 'titleize last name' do
        student = create(:student, last_name: 'willson')
        expect(student.last_name).to eq('willson'.titleize)
      end
    end
  end
end
