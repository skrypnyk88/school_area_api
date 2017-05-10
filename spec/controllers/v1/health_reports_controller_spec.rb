require 'rails_helper'

RSpec.describe V1::HealthReportsController, type: :controller do
  render_views

  def report_params(health_report)
    my_health_report = health_report.attributes.with_indifferent_access
                                    .extract!(:id,
                                              :special_care,
                                              :health_note,
                                              :day)
    student_report = health_report.student.attributes.with_indifferent_access
                                  .extract!(:id, :first_name, :last_name)
    report_hash = { report: my_health_report }
    student_hash = { student: student_report }
    report_hash.merge(student_hash)
  end

  let(:group_1) { create(:group) }

  let(:current_user) { create(:teacher) }

  let!(:current_user_groups) { current_user.groups << group_1 }

  let(:student_1) { create(:student, group: group_1) }
  let(:student_2) { create(:student, group: group_1) }

  let(:report) { create(:health_report, group: group_1, student: student_1) }

  let(:health_report_1) do
    create(:health_report,
           student: student_1,
           group: group_1,
           day: DateTime.now)
  end

  let(:health_report_2) do
    create(:health_report,
           student: student_2,
           group: group_1,
           day: DateTime.now)
  end

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'GET #index' do
    context 'when search for all health reports by students in group' do
      it "returns today's health reports" do
        body = [health_report_1, health_report_2]
               .collect { |n| report_params(n) }
               .to_json
        get :index, format: :json,
                    params: { group_id: group_1.id }
        expect(response.body).to eq(body)
      end

      it "doesn't returns yesterday health reports" do
        body = [health_report_1, health_report_2]
               .collect { |n| report_params(n) }
               .to_json
        Timecop.freeze(Date.today + 1) do
          get :index, format: :json,
                      params: { group_id: group_1.id }
          expect(response.body).to_not include(body)
        end
      end
    end
  end

  describe 'PATCH #update' do
    context 'when report is valid' do
      it 'updates reports attributes' do
        post :update,
             format: :json,
             params: {
               group_id: group_1.id,
               id: report,
               student_id: student_1,
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
               group_id: group_1.id,
               id: report,
               student_id: student_1,
               report: { health_note: 'ASD' * 300 }
             }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
