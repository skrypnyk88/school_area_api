require 'rails_helper'

RSpec.describe V1::HealthReportsController, type: :controller do
  render_views

  def report_params(report)
    report.attributes
          .with_indifferent_access
          .extract!(:id, :special_care, :health_note, :day)
  end

  let(:group) { create(:group) }

  let(:student) { create(:student) }

  let(:report) { create(:health_report, group: group, student: student) }

  let(:create_health_reports) do
    5.times { create(:health_report, group: group, student: student) }
  end

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'GET #index' do
    it 'returns all reports' do
      get :index, format: :json,
                  params: { id: create_health_reports,
                    group_id: group }


                  p response.body

      expect(response.body).to be_eql(HealthReport.all.to_json)
    end
  end

  describe 'PATCH #update' do
    context 'when report is valid' do
      it 'updates reports attributes' do
        post :update,
             format: :json,
             params: {
               method: :patch,
               id: report,
               group_id: group,
               report: { health_note: 'Some text for testing' }
             }

        expect(report.reload.health_note).to eq('Some text for testing')
      end
    end

    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :update,
             format: :json,
             params: {
               method: :patch,
               id: report,
               group_id: group,
               report: { special_care: nil }
             }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
