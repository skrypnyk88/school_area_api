require 'rails_helper'

RSpec.describe V1::HealthReportsController, type: :controller do
  render_views

  let(:post_valid_report) do
    post :create,
         format: :json,
         params: { reports: attributes_for(:health_report) }
  end

  let(:post_invalid_report) do
    post :create,
         format: :json,
         params: { reports: attributes_for(:health_report, special_care: nil ) }
  end

  let(:update_valid_report) do
    post :update,
         format: :json,
         params: {
           method: :patch,
           id: @reports,
           reports: { health_note: 'Some text for testing' }
         }
  end

  let(:update_invalid_report) do
    post :update,
         format: :json,
         params: {
           method: :patch,
           id: @reports,
           reports: { special_care: nil }
         }
  end

  let(:delete_report) do
    post :destroy,
         format: :json,
         params: {
           method: :delete,
           id: @reports
         }
  end

  before do
    @reports = create(:health_report)
  end

  describe 'DELETE #destroy' do
    context 'when report is valid' do
      it 'destroy report' do
        delete_report
        expect(HealthReport.exists?(@reports.id)).to be false
      end
    end
  end

  describe 'GET #index' do
    it 'returns all reports' do
      new_report = create(:health_report)

      get :index, format: :json
      json = JSON.parse(response.body)

      expect(json.any? { |hash| hash['id'] ==  @reports.id }).to be true
      expect(json.any? { |hash| hash['id'] ==  new_report.id }).to be true
    end
  end

  describe 'GET #show' do
    it 'renders report json' do
      get :show, params: { id: @reports },
                 format: :json

      json = JSON.parse(response.body)

      expect(json['id']).to eq(@reports.id)
    end
  end

  describe 'POST #create' do
    context 'when report is valid' do
      it 'renders report json' do
        post_valid_report
        json = JSON.parse(response.body)
        expect(json['id']).to eq(HealthReport.last.id)
      end
    end
    context 'when report is not valid' do
      it 'renders bad_request response' do
        post_invalid_report
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when report is valid' do
      it 'updates reports attributes' do
        update_valid_report
        expect(@reports.reload.health_note).to eq('Some text for testing')
      end
    end

    context 'when report is not valid' do
      it 'renders bad_request response' do
        update_invalid_report
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end


# require 'rails_helper'

# RSpec.describe V1::HealthReportsController, type: :controller do
#   before do
#         @before_count = HealthReport.count

#         post :create, params: {
#           reports: {
#             health_note: "Test note",
#             special_care: false,
#             day: '21.10.2000'
#           }
#         }
#         @before_create = HealthReport.last
#       end
#   describe 'POST #create' do
#     context 'when report was valid' do
#       it 'creates new post' do
#         expect(HealthReport.count).to_not be eq(@before_count)
#       end

#       it 'creates only one report' do
#         expect(HealthReport.count).to be(@before_count+1)
#       end
#     end
#   end

#   describe 'PUT #update' do
#     context 'when report was change' do
#       it 'change report' do
#         report = HealthReport.last
#         report_befor_uppdate = report.health_note
#         report.health_note = "Good helth"
#         report.save
#         expect(report_befor_uppdate)!=(HealthReport.last.health_note)
#       end
#     end
#     context 'when report wasn\'t change' do
#       it 'not change report' do
#         report = HealthReport.last
#         report_befor_uppdate = report.health_note
#         report.health_note = "Test note"
#         report.save
#         expect(report_befor_uppdate)==(HealthReport.last.health_note)
#       end
#     end
#   end

#   describe 'get #show' do
#     it 'show last report' do
#       get :show, params: { id: HealthReport.last }, format: :json

#       expect(response.health_note)==("Test note")
#     end

#     it 'show last report' do
#       expect(HealthReport.last.health_note)!=("Test note with change")
#     end
#   end


#   #   describe 'GET #index' do
#   #   it 'return ' do


#   #     expect(response.status).to eq(200)
#   #   end
#   # end
# end
