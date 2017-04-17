require 'rails_helper'

RSpec.describe V1::ReportTimesController, type: :controller do
  render_views

  let!(:group) { create(:group) }
  let!(:student) { create(:student, group: group) }
  let!(:presence_report) do
    create(:presence_report, group: group, student: student)
  end
  let!(:report) { create(:report_time, reportable: presence_report) }
  before do
    allow(subject).to receive(:authenticate_user!)
  end

  def report_time_json(report)
    {
      id: report.id,
      start_time: report.start_time,
      end_time: report.end_time
    }.to_json
  end

  describe 'POST #create' do
    context 'when group is valid' do
      it 'creates group' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               presence_report_id: presence_report.id,
               report_time: { start_time: '2017-01-01',
                              end_time: '2017-02-01' }
             }
        expect(ReportTime.find_by(start_time: '2017-01-01')).to be_present
      end
    end
    context 'when group is not valid' do
      it 'renders bad_request response' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               presence_report_id: presence_report.id,
               report_time: { start_time: '`a`' }
             }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when group is valid' do
      let(:valid_params) do
        {
          method: :patch,
          id: report,
          group_id: group,
          presence_report_id: presence_report.id,
          report_time: { start_time: '2000-01-01' }
        }
      end

      it 'renders group json' do
        post :update, format: :json,
                      params: valid_params
        expect(response.body).to include(report_time_json(report.reload))
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_params) do
      {
        method: :delete,
        id: report,
        group_id: group,
        presence_report_id: presence_report.id
      }
    end

    it 'deletes reports' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(ReportTime.exists?(report.id)).to be false
    end

    it 'renders ok response' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(response).to have_http_status(:no_content)
    end
  end
end
