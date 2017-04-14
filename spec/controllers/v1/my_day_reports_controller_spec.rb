require 'rails_helper'

RSpec.describe V1::MyDayReportsController, type: :controller do
  render_views

  def report_params(report)
    {
      first_name: report.student.first_name,
      last_name: report.student.last_name,
      my_day_report_id: report.id,
      my_day_report_note: report.note
    }
  end

  let!(:group) { create(:group) }
  let!(:student) { create(:student, group: group) }

  let!(:report) { create(:my_day_report, group: group, student: student) }

  let(:current_user) { create(:teacher) }


  let(:my_day_reports) do
    5.times do
      create(:my_day_report, group: group, student: student)
    end
    group
  end

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  def my_day_report_json_update(report)
    {
      day: report.day,
      note: report.note,
      updated_at: report.updated_at
    }.to_json
  end

  describe 'GET #index' do
    it 'return all reports' do
      response_report = my_day_reports.my_day_reports
                                      .map { |s| report_params(s) }
                                      .to_json
      get :index, format: :json,
                  params: { group_id: group }
      expect(response.body).to eq(response_report)
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
end
