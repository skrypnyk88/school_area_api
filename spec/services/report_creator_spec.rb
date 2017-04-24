require 'rails_helper'

RSpec.describe V1::ReportCreator do
  let!(:group) { FactoryGirl.create(:group) }

  let!(:student_1) {  FactoryGirl.create(:student, group_id: group.id) }

  let!(:student_2) {  FactoryGirl.create(:student, group_id: group.id) }

  let!(:day) { DateTime.now }

  let!(:my_day_report_1) do
    FactoryGirl.create(:my_day_report, student_id: student_1.id,
                                       group_id: group.id,
                                       day: day)
  end

  let!(:report) do
    described_class.new(day: day, group: group, model: MyDayReport)
  end

  describe '#find_or_create' do
    context 'when student don"t have report' do
      it 'should create report for this student' do
        expect { report.find_or_create }
          .to change { MyDayReport.exists?(day: day, student: student_2) }
      end
    end
  end

  describe '#find_or_create' do
    context 'when student have report' do
      it 'should return current report belongs to this student' do
        expect { subject.find_or_create }
          .to_not change { MyDayReport.exists?(day: day, student: student_1) }
      end
    end
  end
end
