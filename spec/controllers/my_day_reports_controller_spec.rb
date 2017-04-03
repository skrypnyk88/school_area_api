require 'rails_helper'

RSpec.describe V1::MyDayReportsController, type: :controller do
  before do
    create(:my_day_report)
  end
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, format: :json
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, params: { id: MyDayReport.last }, format: :json
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 200 status code" do
      post :create, format: :json
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

    describe "PATCH #update" do
    it "update successfully with an HTTP 200 status code" do
      post :update, params: {method: :patch, id: MyDayReport.last, day: "11.11.1111"}, format: :json
      expect(response).to be_success
      expect(response).to have_http_status(204)
    end
  end
end
