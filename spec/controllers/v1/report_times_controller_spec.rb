require 'rails_helper'

RSpec.describe V1::ReportTimesController, type: :controller do
  render_views

  let(:current_user) { create(:teacher) }
  let(:group_1) { create(:group) }
  let!(:current_user_groups) do
    current_user.groups << group_1
  end
  let(:student_1) { create(:student, group_id: group_1.id) }

  let(:presence_report_1) do
    create(:presence_report, group_id: group_1.id,
                             student_id: student_1.id)
  end

  let(:report_time_1) do
    create(:report_time, reportable: presence_report_1)
  end

  let(:nap_report_1) do
    create(:nap_report, group_id: group_1.id,
                        student_id: student_1.id)
  end

  let(:report_time_2) do
    create(:report_time, reportable: nap_report_1)
  end

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'POST #create' do
    context 'when report_time is created (PresenceReport)' do
      it 'create a new report_time' do
        post :create, format: :json,
                      params: { presence_report_id: presence_report_1.id,
                                group_id: group_1.id,
                                report_time: {
                                  start_time: '2017-01-01 11:11'
                                } }
        expect(ReportTime.exists?(start_time: '2017-01-01 11:11')).to be_truthy
      end
    end

    context 'when report_time is created (NapReport)' do
      it 'create a new nap report_time' do
        post :create, format: :json,
                      params: { nap_report_id: nap_report_1.id,
                                group_id: group_1.id,
                                report_time: {
                                  start_time: '2017-01-01 11:11'
                                } }
        expect(ReportTime.exists?(start_time: '2017-01-01 11:11')).to be_truthy
      end
    end
  end

  describe 'PUT #update' do
    context 'when report_time is updated (PresenceReport)' do
      it 'property start_time is updated' do
        Timecop.freeze(DateTime.now) do
          put :update, format: :json,
                       params: { group_id: group_1.id,
                                 presence_report_id: presence_report_1.id,
                                 id: report_time_1.id,
                                 report_time: {
                                   start_time: DateTime.now
                                 } }
          expect(report_time_1.reload.start_time) == Time.zone.now
        end
      end
    end

    context 'when report_time is updated (NapReport)' do
      it 'property start_time is updated' do
        Timecop.freeze(DateTime.now) do
          put :update, format: :json,
                       params: { group_id: group_1.id,
                                 nap_report_id: nap_report_1.id,
                                 id: report_time_2.id,
                                 report_time: {
                                   start_time: DateTime.now
                                 } }
          expect(report_time_2.reload.start_time) == Time.zone.now
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when report_time is deleted (PresenceReport)' do
      it "report_time doesn't exist anymore" do
        delete :destroy, format: :json,
                         params: { group_id: group_1.id,
                                   presence_report_id: presence_report_1.id,
                                   id: report_time_1.id }

        deleted_report_time = ReportTime.find_by id: report_time_1.id

        expect(deleted_report_time).to be_nil
      end
    end

    context 'when report_time is deleted (NapReport)' do
      it "report_time doesn't exist anymore" do
        delete :destroy, format: :json,
                         params: { group_id: group_1.id,
                                   nap_report_id: nap_report_1.id,
                                   id: report_time_2.id }

        deleted_report_time = ReportTime.find_by id: report_time_2.id

        expect(deleted_report_time).to be_nil
      end
    end
  end
end
