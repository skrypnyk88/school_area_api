require 'rails_helper'

RSpec.describe PresenceReport, type: :model do
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
  describe '#day' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:presence_report, day: nil)).to_not be_valid
=======
   describe '#day' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:presence_report, day:nil)).to_not be_valid
>>>>>>> LVRUBYM-192: Unit tests implementation
      end
    end

    context 'when not empty' do
      it 'is valid' do
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
        expect(build(:presence_report, day: '2017-01-11')).to be_valid
=======
        expect(build(:presence_report, day:'2017-01-11')).to be_valid
>>>>>>> LVRUBYM-192: Unit tests implementation
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
        expect(build(:presence_report, day: '20 2017 April')).to_not be_valid
      end
    end
  end
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> LVRUBYM-203: ReportTime model creation
=======
        expect(build(:presence_report, day:'20 2017 April')).to_not be_valid
      end
    end
  end
>>>>>>> LVRUBYM-192: Unit tests implementation
end
