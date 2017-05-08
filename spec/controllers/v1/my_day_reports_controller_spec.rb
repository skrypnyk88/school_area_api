require 'rails_helper'

RSpec.describe V1::MyDayReportsController, type: :controller do
  #  render_views

  #  def report_params(my_day_report)
  #        my_day_report.merge!(my_day_report: my_day_report.my_day_report
  #                            .attributes.with_indifferent_access
  #                            .extract!(:id,
  #                                      :note))
  #                     .merge!(student: my_day_report.student
  #                            .attributes.with_indifferent_access
  #                            .extract!(:id,
  #                                      :first_name,
  #                                      :last_name))
  #  end
  #  let(:current_user) { create(:teacher) }
  #  let!(:group_1) { create(:group) }
  #  let!(:group_2) { create(:group) }
  #  let!(:student_1) { create(:student, group: group_1) }
  #  let!(:student_2) { create(:student, group: group_1) }
  #  let!(:student_3) { create(:student, group: group_2) }
  #  let!(:report_1) { create(:my_day_report,
  #   group: group_1, student: student_1) }
  #  let!(:report_2) { create(:my_day_report,
  #   group: group_1, student: student_2) }
  #  let!(:report_3) { create(:my_day_report,
  #   group: group_2, student: student_3) }
  #  let!(:current_user_groups) do
  #    current_user.groups << group_1
  #  end
  #  # let(:my_day_reports) do
  #  #   5.times do
  #  #     create(:my_day_report, group: group, student: student)
  #  #   end
  #  #   group
  #  # end
  #  before do
  #    allow(subject).to receive(:authenticate_user!)
  #    allow(subject).to receive(:current_user).and_return(current_user)
  #  end

  #  def my_day_report_json_update(report)
  #    {
  #      day: report.day,
  #      note: report.note,
  #      updated_at: report.updated_at
  #    }.to_json
  #  end
  # binding.pry
  #  describe 'GET #index' do
  #    it 'return all reports belongs to current group' do
  #      response_report = [report_1, report_2]
  #                                      .map { |report| report_params(report) }
  #                                      .to_json
  #      get :index, format: :json,
  #                  params: { group_id: group_1 }
  #                  binding.pry
  #      expect(response.body).to eq(response_report)
  #    end
  #  end

  #  describe 'PATCH #update' do
  #    context 'when report is valid' do
  #      let(:valid_params) do
  #        { method: :patch,
  #          id: report_1.id,
  #          group_id: group_1.id,
  #          my_day_report: { note: 'Aaaa' } }
  #      end

  #      it 'updates reports attributes' do
  #        post :update, format: :json,
  #                      params: valid_params
  #        expect(report_1.reload.note)
  #          .to eq(valid_params[:report_1][:note])
  #      end

  #      it 'renders report json' do
  #        post :update, format: :json,
  #                      params: valid_params
  #        expect(response.body).to eq(my_day_report_json_update(report.reload))
  #      end
  #    end
  #  end
end
