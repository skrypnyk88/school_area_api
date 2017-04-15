require 'rails_helper'

RSpec.describe V1::BottleReportsController, type: :controller do
  render_views

  def bottle_report_data(bottle_report)
    bottle_report.attributes.extract!('id',
                                      'day',
                                      'group_id',
                                      'student_id')
                 .merge!(bottles: [])
  end

  let(:test_group) { FactoryGirl.create(:group) }

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'GET #index' do
    context 'when search for all bottle reports by group' do
      it 'return all bottle reports for exact group' do
        test_bottle_reports = FactoryGirl.create_list(:bottle_report, 10,
                                                      group_id: test_group.id)
        get :index, format: :json,
                    group_id: test_group.id

        expect(response.body)
          .to eq(test_bottle_reports
          .collect { |entry| bottle_report_data(entry) }.to_json)
      end
    end

    context 'when search for all bottle reports by day and group' do
      it 'return all bottle reports for exact day and group' do
        test_bottle_reports = FactoryGirl.create_list(:bottle_report, 10,
                                                      group_id: test_group.id,
                                                      day: DateTime.now)
        get :index, format: :json,
                    group_id: test_group.id,
                    day: DateTime.now

        expect(response.body)
          .to eq(test_bottle_reports
          .collect { |entry| bottle_report_data(entry) }.to_json)
      end
    end
  end
end
