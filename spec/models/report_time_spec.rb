require 'rails_helper'

RSpec.describe ReportTime, type: :model do
<<<<<<< b65e4a29b844cb164727aae68d6b9ad169158d53
  let(:presence_report) do
    create(:presence_report)
  end

  describe '#start_time' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:report_time, start_time: nil,
                                   reportable: presence_report)).to_not be_valid
      end
    end

    context 'when not empty' do
      it 'is valid' do
        expect(build(:report_time, start_time: '2017-01-11',
                                   reportable: presence_report)).to be_valid
      end
    end
  end

  describe '#end_time' do
    context 'when not empty' do
      it 'is valid' do
        expect(build(:report_time, start_time: '2017-01-10',
                                   end_time: '2017-01-11',
                                   reportable: presence_report)).to be_valid
      end
    end
  end
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> LVRUBYM-203: ReportTime model creation
end
