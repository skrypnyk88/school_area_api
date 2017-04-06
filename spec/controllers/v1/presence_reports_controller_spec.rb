require 'rails_helper'

RSpec.describe V1::PresenceReportsController, type: :controller do
  render_views

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

  # describe 'GET #index' do
  #   it 'returns all reports' do
  #     presence_report = PresenceReport.select(:id, :day).to_json
  #     get :index, format: :json
  #     expect(response.body).to include(presence_report)
  #   end
  # end

  # describe 'POST #create' do
  #   # context 'when report is valid' do
  #   #   it 'renders report json' do
  #   #     post :create,
  #   #          format: :json,
  #   #          params: {
  #   #            presence_report: attributes_for(:presence_report)
  #   #          }

  #   #     expect(JSON.parse(response.body)).to be_eql('show')
  #   #   end
  #   # end
  #   context 'when report is not valid' do
  #     it 'renders bad_request response' do
  #       post :create,
  #            format: :json,
  #            params: {
  #              presence_report: attributes_for(:presence_report, day: nil)
  #            }

  #       expect(response).to have_http_status(:bad_request)
  #     end
  #   end
  # end

  # describe 'PATCH #update' do
  #   context 'when report is valid' do
  #     it 'updates reports attributes' do
  #       post :update,
  #            format: :json,
  #            params: {
  #              method: :patch,
  #              id: @presence_report,
  #              presence_report: { day: '2000-01-01' }
  #            }

  #       expect(@presence_report.reload.day) == '2000-01-01'
  #     end
  #   end

  #   context 'when report is not valid' do
  #     it 'renders bad_request response' do
  #       post :update,
  #            format: :json,
  #            params: {
  #              method: :patch,
  #              id: @presence_report,
  #              presence_report: { day: nil }
  #            }
  #       expect(response).to have_http_status(:bad_request)
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   context 'when report is valid' do
  #     it 'destroy report' do
  #       post :destroy,
  #            format: :json,
  #            params: {
  #              method: :delete,
  #              id: @presence_report
  #            }

  #       expect(PresenceReport.exists?(@presence_report.id)).to be false
  #     end
  #   end
  # end
>>>>>>> LVRUBYM-219: Fixed
end
