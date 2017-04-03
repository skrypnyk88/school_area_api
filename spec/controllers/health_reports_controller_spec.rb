require 'rails_helper'

RSpec.describe V1::HealthReportsController, type: :controller do
  describe 'POST #create' do
    before do
        @before_count = HealthReport.count

        post :create, params: {
          reports: {
            health_note: "Test note",
            special_care: false
          }
        }
      end
    context 'when report was valid' do
      it 'creates new post' do
        expect(HealthReport.count).to_not be eq(@before_count)
      end
      it 'creates only one report' do
        expect(HealthReport.count).to be(@before_count+1)
      end
    end
  end

  describe 'PUT #update' do
    context 'when report was change' do
      @before_edit = HealthReport.first
      it 'change report' do
        report = HealthReport.first
        report.health_note = "Good helth"
        report.save
        expect(HealthReport.first).to_not be eq(@before_edit)
      end
    end
  end

    describe 'GET #index' do
    it 'return status 200' do
      get :index, format: :json

      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'return status 200' do
      get :show, format: :json

      expect(response.status).to eq(200)
    end
  end
end









































# require 'rails_helper'

# RSpec.describe V1::MyDayReportsController, type: :controller do
#   before do
#     create(:my_day_report)
#   end
#   describe "GET #index" do
#     it "responds successfully with an HTTP 200 status code" do
#       get :index, format: :json
#       expect(response).to be_success
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "GET #show" do
#     it "responds successfully with an HTTP 200 status code" do
#       get :show, params: { id: MyDayReport.last }, format: :json
#       expect(response).to be_success
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "POST #create" do
#     it "responds successfully with an HTTP 200 status code" do
#       post :create, format: :json
#       expect(response).to be_success
#       expect(response).to have_http_status(200)
#     end
#   end

#     describe "PATCH #update" do
#     it "update successfully with an HTTP 200 status code" do
#       post :update, params: {method: :patch, id: MyDayReport.last, day: "11.11.1111"}, format: :json
#       expect(response).to be_success
#       expect(response).to have_http_status(204)
#     end
#   end
# end
