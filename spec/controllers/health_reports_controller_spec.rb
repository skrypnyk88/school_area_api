require 'rails_helper'

RSpec.describe V1::HealthReportsController, type: :controller do
  render_views

  before do
    @reports = create(:health_report)
  end

  describe 'GET #show' do
    it 'renders report json' do
      get :show, params: { id: @reports },
                 format: :json
      expect(response.body) == HealthReport.where(id: @reports).first.to_json
    end
  end

  describe 'DELETE #destroy' do
    context 'when report is valid' do
      it 'destroy report' do
        post :destroy,
             format: :json,
             params: {
               method: :delete,
               id: @reports
             }

        expect(HealthReport.exists?(@reports.id)).to be false
      end
    end
  end

  describe 'GET #index' do
    it 'returns all reports' do
      create(:health_report)

      get :index, format: :json
      expect(response.body) == HealthReport.where(id: @reports).first.to_json
    end
  end

  describe 'POST #create' do
    context 'when report is valid' do
      it 'renders report json' do
        post :create, format: :json,
                      params: { reports: attributes_for(:health_report) }

        expect(HealthReport.exists?(@reports.id)).to be true
      end
    end
    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :create, format: :json,
                      params: { reports: attributes_for(:health_report,
                                                        special_care: nil) }

        expect(response).to have_http_status(:unprocessable_entity)
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
               id: @reports,
               reports: { health_note: 'Some text for testing' }
             }

        expect(@reports.reload.health_note).to eq('Some text for testing')
      end
    end

    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :update,
             format: :json,
             params: {
               method: :patch,
               id: @reports,
               reports: { special_care: nil }
             }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
