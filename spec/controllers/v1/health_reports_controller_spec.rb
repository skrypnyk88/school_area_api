require 'rails_helper'

RSpec.describe V1::HealthReportsController, type: :controller do
  render_views

  before do
    @report = create(:health_report)
  end

  describe 'GET #show' do
    it 'returns report' do
      report = HealthReport.select(:id,
                                   :special_care,
                                   :health_note,
                                   :day).to_json
      report[0] = ''
      report[-1] = ''

      get :show, params: { id: @report },
                 format: :json

      expect(response.body).to be_eql(report)
    end
  end

  describe 'GET #index' do
    it 'returns all reports' do
      create(:health_report)
      report = HealthReport.select(:id,
                                   :special_care,
                                   :health_note,
                                   :day).to_json

      get :index, format: :json

      expect(response.body).to be_eql(report)
    end
  end

  describe 'POST #create' do
    context 'when report is valid' do
      it 'renders report json' do
        post :create, format: :json,
                      params: { report: attributes_for(:health_report) }

        expect(JSON.parse(response.body)).to be_eql('show')
      end
    end
    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :create, format: :json,
                      params: { report: attributes_for(:health_report,
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
               id: @report,
               report: { health_note: 'Some text for testing' }
             }

        expect(@report.reload.health_note).to eq('Some text for testing')
      end
    end

    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :update,
             format: :json,
             params: {
               method: :patch,
               id: @report,
               report: { special_care: nil }
             }
        expect(response).to have_http_status(:unprocessable_entity)
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
               id: @report
             }

        expect(HealthReport.exists?(@report.id)).to be false
      end
    end
  end
end
