require 'rails_helper'

RSpec.describe V1::PresenceReportsController, type: :controller do
  render_views

  def presence_report_data(presence_report)
    presence_report.attributes.with_indifferent_access.extract!(:id,
                                                                :day,
                                                                :group_id)
                   .merge(student: presence_report.student
                   .attributes.with_indifferent_access.extract!(:id,
                                                                :first_name,
                                                                :last_name))
                   .merge(report_time: [])
  end

  let(:current_user) { create(:teacher) }
  let(:group_1) { create(:group) }

  let!(:current_user_groups) do
    current_user.groups << group_1
  end

  let(:student_1) { create(:student, group_id: group_1.id) }
  let(:student_2) { create(:student, group_id: group_1.id) }

  let!(:presence_report_1) do
    create(:presence_report,
           student_id: student_1.id,
           group_id: group_1.id,
           day: DateTime.now)
  end
  let!(:presence_report_2) do
    create(:presence_report,
           student_id: student_2.id,
           group_id: group_1.id,
           day: DateTime.now)
  end
  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'GET #index' do
    context 'when search for all presence reports by students in group' do
      it "returns today's presence reports" do
        get :index, format: :json,
                    params: { group_id: group_1.id }
        body = [presence_report_1, presence_report_2]
               .collect { |n| presence_report_data(n) }
               .to_json
        expect(response.body).to eq(body)
      end

      it "doesn't returns yesterday presence reports" do
        Timecop.freeze(Date.today + 1) do
          get :index, format: :json,
                      params: { group_id: group_1.id }
          body = [presence_report_1, presence_report_2]
                 .collect { |n| presence_report_data(n) }
                 .to_json
          expect(response.body).to_not include(body)
        end
      end
    end
  end
end
