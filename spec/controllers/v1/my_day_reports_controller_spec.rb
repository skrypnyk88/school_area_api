require 'rails_helper'

RSpec.describe V1::MyDayReportsController, type: :controller do
  render_views
  let!(:group) { create(:group) }

  let!(:student) { create(:student, group: group) }
  let!(:report) { create(:my_day_report, group: group, student: student) }

  let(:current_user) { create(:teacher) }

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  def my_day_report_json(report)
    {
      id: report.id,
      group_id: report.group_id,
      day: report.day,
      student_id: report.student_id,
      note: report.note
    }.to_json
  end

  def my_day_report_json_update(report)
    {
      day: report.day,
      note: report.note,
      updated_at: report.updated_at
    }.to_json
  end

  def my_day_report_params(report)
    report.attributes.extract!(:day, :note)
  end

  describe 'GET #index' do
    it 'return all reports' do
      get :index, format: :json,
                  params: { group_id: group }
      expect(response.body).to eq(MyDayReport.all.to_json)
    end
  end

  describe 'GET #show' do
    it 'renders my_day_report json' do
      get :show, format: :json,
                 params: { id: report, group_id: group }
      expect(response.body).to eq(my_day_report_json(report))
    end
  end

  describe 'PATCH #update' do
    context 'when report is valid' do
      let(:valid_params) do
        { method: :patch,
          id: report,
          group_id: group,
          report: { note: 'Aaaa' } }
      end

      it 'updates reports attributes' do
        post :update, format: :json,
                      params: valid_params
        expect(report.reload.note)
          .to eq(valid_params[:report][:note])
      end

      it 'renders report json' do
        post :update, format: :json,
                      params: valid_params
        expect(response.body).to eq(my_day_report_json_update(report.reload))
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_params) { { method: :delete, id: report, group_id: group } }

    it 'deletes reports' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(MyDayReport.exists?(report.id)).to be false
    end

    it 'renders ok response' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(response).to have_http_status(:no_content)
    end
  end
end
