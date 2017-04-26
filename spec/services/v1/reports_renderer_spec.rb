require 'rails_helper'

RSpec.describe V1::ReportsRenderer do
  TestReport = Struct.new(:day, :students, :model) do
    def self.find_or_create_by(params)
      new(params)
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

  describe '#find_or_create' do
    it 'should return report for each student' do
      expect(report_renderer.call.length).to eq(2)
    end

    it 'should return all reports are type TestReport' do
      expect(report_renderer.call).to all(be_a(TestReport))
    end
  end
end
