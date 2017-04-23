<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c
require 'rails_helper'

RSpec.describe V1::PresenceReportsController, type: :controller do
  render_views
  let!(:group) { create(:group) }

<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
  def presence_report_data(presence_report)
    presence_report.attributes.with_indifferent_access.extract!(:id,
                                                                :day,
                                                                :group_id)
                   .merge(student: presence_report.student
                          .attributes.with_indifferent_access
                          .extract!(:id,
                                    :first_name,
                                    :last_name))
                   .merge(report_time: [])
  end

  let(:current_user) { create(:teacher) }
  let(:group_1) { create(:group) }

  let!(:current_user_groups) do
    current_user.groups << group_1
  end

  let(:student_1) { create(:student, group: group_1) }
  let(:student_2) { create(:student, group: group_1) }

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
  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'GET #index' do
    context 'when search for all presence reports by students in group' do
      it "returns today's presence reports" do
        body = [presence_report_1, presence_report_2]
               .collect { |n| presence_report_data(n) }
               .to_json
        get :index, format: :json,
                    params: { group_id: group_1.id }
        expect(response.body).to eq(body)
      end

      it "doesn't returns yesterday presence reports" do
        body = [presence_report_1, presence_report_2]
               .collect { |n| presence_report_data(n) }
               .to_json
        Timecop.freeze(Date.today + 1) do
          get :index, format: :json,
                      params: { group_id: group_1.id }

          expect(response.body).to_not include(body)
        end
      end
    end
  end
=======
  # before do
  #   @presence_report = create(:presence_report)
  # end
=======
  let!(:student) { create(:student, group: group) }
  let!(:report) do
    create(:presence_report, group: group, student: student)
  end
>>>>>>> LVRUBYM-219: add ReportTimesController

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

<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
  #       expect(PresenceReport.exists?(@presence_report.id)).to be false
  #     end
  #   end
  # end
>>>>>>> LVRUBYM-219: Fixed
=======
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
>>>>>>> LVRUBYM-219: add ReportTimesController
end
=======
# require 'rails_helper'

# RSpec.describe V1::PresenceReportsController, type: :controller do
#   render_views
#   let!(:group) { create(:group) }
#   let!(:student) { create(:student, group: group) }
#   let!(:report) do
#     create(:presence_report, group: group, student: student)
#   end

#   before do
#     allow(subject).to receive(:authenticate_user!)
#   end

#   def presence_report_json(report)
#     {
#       id: report.id,
#       group_id: report.group_id,
#       day: report.day,
#       student_id: report.student_id
#     }.to_json
#   end

#   describe 'GET #index' do
#     it 'return all reports' do
#       get :index, format: :json,
#                   params: { group_id: group }
#       expect(response.body).to eq(PresenceReport.all.to_json)
#     end
#   end

# end
>>>>>>> LVRUBYM-191: rebase master branch
