require 'rails_helper'

RSpec.describe PresenceReport, type: :model do
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
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
=======
  describe '#day' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:presence_report, day: nil)).to_not be_valid
>>>>>>> LVRUBYM-190: User actions on backend
      end
    end

    context 'when not empty' do
      it 'is valid' do
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
        expect(build(:presence_report, day: '2017-01-11')).to be_valid
=======
        expect(build(:presence_report, day:'2017-01-11')).to be_valid
>>>>>>> LVRUBYM-192: Unit tests implementation
=======
        expect(build(:presence_report, day: '2017-01-11')).to be_valid
>>>>>>> LVRUBYM-190: User actions on backend
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
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
=======
        expect(build(:presence_report, day: '20 2017 April')).to_not be_valid
>>>>>>> LVRUBYM-190: User actions on backend
      end
    end
=======
  # describe '#day' do
  #   context 'when empty' do
  #     it 'is invalid' do
  #       expect(build(:presence_report, day: nil)).to_not be_valid
  #     end
  #   end

  #   context 'when not empty' do
  #     it 'is valid' do
  #       expect(build(:presence_report, day: '2017-01-11')).to be_valid
  #     end
  #   end

  #   context 'when incorrect order' do
  #     it 'is invalid' do
  #       expect(build(:presence_report, day: '20 2017 April')).to_not be_valid
  #     end
  #   end
>>>>>>> LVRUBYM-219: Fixed
  end
>>>>>>> LVRUBYM-192: Unit tests implementation
end
