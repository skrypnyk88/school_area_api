require 'rails_helper'

RSpec.describe ReportTime, type: :model do
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
        expect(build(:report_time, end_time: '2017-01-11',
                                   reportable: presence_report)).to be_valid
      end
    end
  end
end
