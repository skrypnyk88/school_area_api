require 'rails_helper'

RSpec.describe V1::OurDaysController, type: :controller do
  render_views
  def our_day_params(our_day)
    our_day.attributes
           .with_indifferent_access
           .extract!(:id, :description, :day)
  end

  let(:group) { create(:group) }

  let(:our_day) { create(:our_day, group: group) }

  let(:report_attrs) { attributes_for(:our_day).with_indifferent_access }

  let(:our_day_reports) do
    3.times do
      create(:our_day, group: group)
    end
    group
  end

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'GET #index' do
    it 'returns all our day reports' do
      response_report = our_day_reports.our_days
                                       .map { |s| our_day_params(s) }
                                       .to_json

      get :index, format: :json,
                  params: { group_id: group }

      expect(response.body).to eq(response_report)
    end
  end

  describe 'POST #create' do
    context 'when our_day is valid' do
      it 'creates our day report' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               our_day: report_attrs
             }

        expect(OurDay.find_by(report_attrs)).to be_present
      end
      it 'render report json' do
        report_attrs[:day] = report_attrs[:day].to_s

        post :create,
             format: :json,
             params: {
               group_id: group,
               our_day: report_attrs
             }

        expect(JSON.parse(response.body)).to include(report_attrs)
      end
    end

    context 'when report is not valid' do
      it 'render bad_reqest' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               our_day: attributes_for(:our_day, description: '')
             }

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET #show' do
    it 'render our_day json' do
      get :show,
          params: {
            group_id: group,
            id: our_day
          },
          format: :json
      expect(response.body).to eq(our_day_params(our_day).to_json)
    end
  end

  describe 'PATCH #update' do
    context 'when our_day is valid' do
      let(:valid_params) do
        { method: :patch,
          group_id: group,
          id: our_day,
          our_day: { description: 'Something' } }
      end

      it 'updates our_day attributes' do
        post :update, format: :json,
                      params: valid_params

        expect(our_day.reload.description)
          .to eq(valid_params[:our_day][:description])
      end

      it 'renders our_day json' do
        post :update, format: :json,
                      params: valid_params
        expect(response.body).to eq(our_day_params(our_day.reload).to_json)
      end
    end

    context 'when our_day is not valid' do
      let(:invalid_params) do
        { method: :patch,
          group_id: group,
          id: our_day,
          our_day: { description: '' } }
      end

      it 'renders bad_reqest' do
        post :update, format: :json,
                      params: invalid_params

        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
