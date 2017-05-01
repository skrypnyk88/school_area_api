require 'rails_helper'

RSpec.describe V1::BottleReportsController, type: :controller do
  render_views

  def bottle_report_data(bottle_report)
    bottle_report.attributes.with_indifferent_access.extract!(:id,
                                                              :day,
                                                              :group_id)
                 .merge!(student: bottle_report.student
                 .attributes.with_indifferent_access.extract!(:id,
                                                              :first_name,
                                                              :last_name))
                 .merge!(bottles: [])
  end

  let(:current_user) { create(:teacher) }

  let!(:current_user_groups) do
    current_user.groups << group_1
  end

  let(:group_1) { create(:group) }

  let(:group_2) { create(:group) }

  let(:student_1) { create(:student, group_id: group_1.id) }

  let(:student_2) { create(:student, group_id: group_1.id) }

  let(:student_3) { create(:student, group_id: group_2.id) }

  let(:bottle_report_1) do
    create(:bottle_report,
           student_id: student_1.id,
           group_id: group_1.id,
           day: DateTime.now)
  end

  let(:bottle_report_2) do
    create(:bottle_report,
           student_id: student_2.id,
           group_id: group_1.id,
           day: DateTime.now)
  end

  let(:bottle_report_3) do
    create(:bottle_report,
           student_id: student_3.id,
           group_id: group_2.id,
           day: DateTime.now)
  end

  let(:presence_report_1) do
    create(:presence_report,
           student: student_1,
           group: group_1,
           day: DateTime.now)
  end

  let(:presence_report_2) do
    create(:presence_report,
           student: student_2,
           group: group_1,
           day: DateTime.now)
  end

  let(:presence_report_3) do
    create(:presence_report,
           student: student_3,
           group: group_2,
           day: DateTime.now)
  end

  let!(:report_time_1) do
    create(:report_time, reportable: presence_report_1)
  end

  let!(:report_time_2) do
    create(:report_time, reportable: presence_report_2)
  end

  let!(:report_time_3) do
    create(:report_time, reportable: presence_report_3)
  end

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'GET #index' do
    context 'when search for bottle reports by present students in group' do
      it 'return today"s bottle reports for exact group' do
        body = [bottle_report_1,
                bottle_report_2].collect { |entry| bottle_report_data(entry) }
               .to_json

        get :index, format: :json,
                    params: { group_id: group_1.id }

        expect(response.body).to eq(body)
      end

      it "doesn't returns yesterday bottle reports" do
        body = [bottle_report_1,
                bottle_report_2].collect { |entry| bottle_report_data(entry) }
               .to_json

        Timecop.freeze(Date.today + 1) do
          get :index, format: :json,
                      params: { group_id: group_1.id }

          expect(response.body).to_not include(body)
        end
      end
    end
  end
end
