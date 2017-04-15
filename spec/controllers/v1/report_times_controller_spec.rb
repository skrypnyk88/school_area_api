require 'rails_helper'

RSpec.describe V1::ReportTimesController, type: :controller do
  render_views

<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
  def report_time_data(_report_time)
    bottle.attributes.with_indifferent_access.extract!(:id,
                                                       :start_time,
                                                       :end_time)
  end

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

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'POST #create' do
    context 'when report_time is created' do
      it 'create a new report_time' do
        post :create, format: :json,
                      params: { presence_report_id: presence_report_1.id,
                                group_id: group_1.id,
                                report_time: {
                                  start_time: '2017-01-01 11:11'
                                } }
        expect(ReportTime.exists?(start_time: '2017-01-01 11:11')).to be_truthy
=======
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

  def report_time_params(report)
    report.attributes.extract!(:start_time)
  end

  describe 'GET #index' do
    it 'return all reports' do
      get :index, format: :json,
                  params: { group_id: group,
                            presence_report_id: presence_report.id }
      expect(response.body)
        .to include(report_time_json(report))
    end
  end

  describe 'GET #show' do
    it 'renders presence_report json' do
      get :show, format: :json,
                 params: { id: report,
                           group_id: group,
                           presence_report_id: presence_report.id }
      expect(response.body).to eq(report_time_json(report))
    end
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
>>>>>>> LVRUBYM-219: add ReportTimesController
      end
    end
  end

<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
  describe 'PUT #update' do
    context 'when report_timee is updated' do
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
  end

  describe 'DELETE #destroy' do
    context 'when report_time is deleted' do
      it "report_time doesn't exist anymore" do
        delete :destroy, format: :json,
                         params: { group_id: group_1.id,
                                   presence_report_id: presence_report_1.id,
                                   id: report_time_1.id }

        deleted_report_time = ReportTime.find_by id: report_time_1.id

        expect(deleted_report_time).to be_nil
      end
=======
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
>>>>>>> LVRUBYM-219: add ReportTimesController
    end
  end
end
