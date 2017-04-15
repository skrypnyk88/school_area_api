require 'rails_helper'

RSpec.describe V1::PresenceReportsController, type: :controller do
  render_views
  let!(:group) { create(:group) }

  let!(:student) { create(:student, group: group) }
  let!(:report) do
    create(:presence_report, group: group, student: student)
  end

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  def presence_report_json(report)
    {
      id: report.id,
      group_id: report.group_id,
      day: report.day,
      student_id: report.student_id
    }.to_json
  end

  def presence_report_json_update(report)
    {
      day: report.day,
      updated_at: report.updated_at
    }.to_json
  end

  def presence_report_params(report)
    report.attributes.extract!(:day)
  end

  describe 'GET #index' do
    it 'return all reports' do
      get :index, format: :json,
                  params: { group_id: group }
      expect(response.body).to eq(PresenceReport.all.to_json)
    end
  end

  describe 'GET #show' do
    it 'renders presence_report json' do
      get :show, format: :json,
                 params: { id: report, group_id: group }
      expect(response.body).to eq(presence_report_json(report))
    end
  end

  describe 'POST #create' do
    context 'when group is not valid' do
      it 'renders bad_request response' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               report: { day: '`a`' }
             }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_params) { { method: :delete, id: report, group_id: group } }

    it 'deletes reports' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(PresenceReport.exists?(report.id)).to be false
    end

    it 'renders ok response' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(response).to have_http_status(:no_content)
    end
  end
end
