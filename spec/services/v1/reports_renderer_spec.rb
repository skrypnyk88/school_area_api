require 'rails_helper'

RSpec.describe V1::ReportsRenderer do
  class TestReport
    def initialize(day:, group:, student:)
      @day = day
      @group = group
      @student = student
    end

    attr_reader :day, :group, :student

    def self.find_or_create_by(params = {})
      TestReport.new(day: params[:day],
                     group: params[:group],
                     student: params[:student])
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
    context 'when student don"t have report' do
      it 'should create report for this student' do
        expect(report_renderer.call.length).to eq(2)
      end
    end
  end

  describe '#find_or_create' do
    context 'when student have report' do
      it 'should return current report belongs to this student' do
        expect(report_renderer.call).to all((be_a(TestReport)
          .and satisfy { |t| t.day == day && t.group == group }))
      end
    end
  end
end
