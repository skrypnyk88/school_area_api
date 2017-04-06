require 'rails_helper'

RSpec.describe V1::PresenceReportsController, type: :controller do
  render_views

  before do
    @presence_report = create(:presence_report)
  end

  describe 'GET #index' do
    it 'returns all reports' do
      presence_report = PresenceReport.select(:id, :day).to_json
      get :index, format: :json
      expect(response.body).to include(presence_report)
    end
  end

  describe 'POST #create' do
    context 'when report is valid' do
      it 'renders report json' do
        post :create,
             format: :json,
             params: {
               presence_report: attributes_for(:presence_report)
             }

        expect(JSON.parse(response.body)).to be_eql('show')
      end
    end
    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :create,
             format: :json,
             params: {
               presence_report: attributes_for(:presence_report, day: nil)
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
               id: @presence_report,
               presence_report: { day: '2000-01-01' }
             }

        expect(@presence_report.reload.day) == '2000-01-01'
      end
    end

    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :update,
             format: :json,
             params: {
               method: :patch,
               id: @presence_report,
               presence_report: { day: nil }
             }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when report is valid' do
      it 'destroy report' do
        post :destroy,
             format: :json,
             params: {
               method: :delete,
               id: @presence_report
             }

        expect(PresenceReport.exists?(@presence_report.id)).to be false
      end
    end
  end
end
