require 'rails_helper'

RSpec.describe V1::BottleReportsController, type: :controller do
  render_views
  let(:test_group) { FactoryGirl.create(:group) }
  let(:test_bottle_report) { FactoryGirl.create(:bottle_report,
                                                group_id: test_group.id) }

  describe 'GET #index' do
    context 'when search for all bottle reports' do
      it 'return all bottle reports' do
        test_bottle_reports = FactoryGirl.create_list(:bottle_report, 10,
                                                      group_id: test_group.id)
        get :index, format: :json, group_id: test_group.id

        expect([JSON.parse(response.body).map { |entry| entry['id']}])
        .to contain_exactly(test_bottle_reports.map(&:id))
      end
    end
  end

  describe 'GET #show' do
    context 'when search for existing bottle report bolongs to exact group' do
      it 'return existing bottle_report' do
        get :show, format: :json, day: test_bottle_report.day,
                   group_id: test_group.id
        expect(JSON.parse(response.body)[0]['id']).to eq(test_bottle_report.id)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when bottle_report is deleted' do
      it 'bottle_report doesn"t exist anymore' do
        existed_bottle_reports = BottleReport.find_by id:
        test_bottle_report.id

        delete :destroy, format: :json, id: test_bottle_report.id,
                         group_id: test_group.id
        deleted_bottle_report = BottleReport.find_by id: test_bottle_report.id

        expect(existed_bottle_reports).not_to be nil
        expect(deleted_bottle_report).to be nil
      end
    end
  end
end
