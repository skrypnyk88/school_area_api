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

  let(:atr_for_rep) { attributes_for(:health_report).with_indifferent_access }

  let(:group_report) do
    5.times do
      create(:health_report, group: group)
    end
    group
  end

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'GET #show' do
    it 'returns report' do
      get :show, params: { id: report },
                 format: :json

      expect(response.body).to eq(report_params(report).to_json)
    end
  end

  describe 'GET #index' do
    it 'returns all reports' do
      responce_report = group_report.health_reports
                                    .map { |s| report_params(s) }
                                    .to_json

      get :index, format: :json,
                  params: { group_id: group_report }

      expect(response.body).to be_eql(responce_report)
    end
  end

  describe 'POST #create' do
    context 'when report is valid' do
      it 'renders report json' do
        test_report = report

        post :create,
             format: :json,
             params: {
               group_id: 1,
               student_id: 1,
               id: test_report
             }

        expect(HealthReport.find_by(report_params(test_report))).to be_present
      end
    end
    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               student_id: student,
               report: atr_for_rep
             }

        expect(response).to have_http_status(:bad_request)
      end
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
               report: { special_care: nil }
             }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_params) { { method: :delete, id: report } }
    context 'when report is valid' do
      it 'destroy report' do
        post :destroy,
             format: :json,
             params: delete_params

        expect(HealthReport.exists?(report.id)).to be false
      end

      it 'renders ok response' do
        post :destroy,
             format: :json,
             params: delete_params

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
