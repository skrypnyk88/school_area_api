require 'rails_helper'

RSpec.describe ReportsRenderer do
  TestReport = Struct.new(:day, :student, :group) do
    def self.find_or_create_by(params)
      new(params[:day], params[:student], params[:group])
    end
  end

  let(:group) { FactoryGirl.create(:group) }

  let(:students) do
    FactoryGirl.create_list(:student, 2, group_id: group.id)
  end

  let(:day) { DateTime.now }

  let(:report_renderer) do
    described_class.new(day: day, students: students, model: TestReport)
  end

  describe '.find_or_create_by' do
    it 'should return report for each student' do
      expect(report_renderer.call.length).to eq(students.length)
    end

    it 'should return all reports are type TestReport' do
      expect(report_renderer.call).to all(be_a(TestReport))
    end

    it 'should have attributes set with correct values' do
      expect(TestReport).to receive(:find_or_create_by)
        .once.with(day: day,
                   student: students.first,
                   group: group)
      expect(TestReport).to receive(:find_or_create_by)
        .once.with(day: day,
                   student: students.last,
                   group: group)
      report_renderer.call
    end
  end
end
