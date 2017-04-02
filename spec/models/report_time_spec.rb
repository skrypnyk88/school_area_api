require 'rails_helper'

RSpec.describe ReportTime, type: :model do
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
  let(:presence_report) do
    create(:presence_report)
  end

  describe '#start_time' do
    context 'when empty' do
      it 'is invalid' do
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
        expect(build(:report_time, start_time: nil,
                                   reportable: presence_report)).to_not be_valid
=======
        expect(build(:presence_report, day: nil)).to_not be_valid
>>>>>>> LVRUBYM-190: User actions on backend
      end
    end

    context 'when not empty' do
      it 'is valid' do
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
        expect(build(:report_time, start_time: '2017-01-11',
                                   reportable: presence_report)).to be_valid
=======
        expect(build(:presence_report, day: '2017-01-11')).to be_valid
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
        expect(build(:presence_report, day: '20 2017 April')).to_not be_valid
>>>>>>> LVRUBYM-190: User actions on backend
      end
    end
  end

  describe '#end_time' do
    context 'when not empty' do
      it 'is valid' do
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
        expect(build(:report_time, start_time: '2017-01-10',
                                   end_time: '2017-01-11',
                                   reportable: presence_report)).to be_valid
=======
        expect(build(:presence_report, day: '2017-01-11')).to be_valid
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
        expect(build(:presence_report, day: '20 2017 April')).to_not be_valid
>>>>>>> LVRUBYM-190: User actions on backend
      end
    end
  end
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> LVRUBYM-203: ReportTime model creation
end
