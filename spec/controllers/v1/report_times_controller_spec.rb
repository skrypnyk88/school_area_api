require 'rails_helper'

RSpec.describe V1::ReportTimesController, type: :controller do
  render_views

  before do
    @presence_report = create(:presence_report)
    @report_time = create(:report_time)
    @report_time_json = create(:report_time).to_json
  end

  describe 'GET #index' do
    it 'returns all reports' do
      @new_report = create(:report_time).to_json
      get :index,
          format: :json,
          params: {
            presence_report_id: 1
          }

      expect(response.body).to include(@report_time_json)
      expect(response.body).to include(@new_report)
    end
  end

  describe 'POST #create' do
    context 'when report is valid' do
      it 'renders student json' do
        report_time_attrs = attributes_for(:report_time)

        post :create,
             format: :json,
             params: {
               report_time: report_time_attrs,
               presence_report_id: 1
             }

        expect(JSON.parse(response.body)).to be_eql('show')
      end
    end
    context 'when report is not valid' do
      it 'renders bad_request response' do
        report_time_attrs = attributes_for(:report_time, start_time: 'sada')
        post :create,
             format: :json,
             params: {
               report_time: report_time_attrs,
               presence_report_id: 1
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
               report_time: { start_time: '2016-01-01' },
               presence_report_id: 1,
               id: @report_time
             }

        expect(@report_time.reload.start_time).to eq('2016-01-01')
      end
    end

    context 'when report is not valid' do
      it 'renders bad_request response' do
        post :update,
             format: :json,
             params: {
               method: :patch,
               id: @report_time,
               report_time: { start_time: 'one' },
               presence_report_id: 1
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
               id: @report_time,
               presence_report_id: 1
             }

        expect(ReportTime.exists?(@report_time.id)).to be false
      end
    end
  end
end
