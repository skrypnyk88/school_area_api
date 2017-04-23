require 'rails_helper'

RSpec.describe V1::ReportCreator do
  let!(:group) { FactoryGirl.create(:group) }

  let!(:student_1) {  FactoryGirl.create(:student, group_id: group.id) }

  let!(:student_2) {  FactoryGirl.create(:student, group_id: group.id) }

  let!(:day) { DateTime.now }

  let!(:bottle_report_1) do
    FactoryGirl.create(:bottle_report, student_id: student_1.id,
                                       group_id: group.id,
                                       day: day)
  end

  subject do
    V1::ReportCreator.new(day: day, group: group, model: BottleReport)
  end

  describe '#find_or_create' do
    context 'when student don"t have report' do
      it 'should create report for this student' do

        expect { subject.find_or_create }
          .to change { BottleReport.exists?(day: day,
                                            student: student_2) }
          .from(false).to(true)
      end
    end
  end

  describe '#find_or_create' do
    context 'when student have report' do
      it 'should return current report belongs to this student' do

        expect { subject.find_or_create }
          .to_not change { BottleReport.exists?(day: day,
                                                student: student_1) }
      end
    end
  end
end
