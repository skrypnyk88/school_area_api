require 'rails_helper'

RSpec.describe V1::OurDaysController, type: :controller do render_views
  def our_day_json(our_day)
    {
      id: our_day.id,
      description: our_day.description,
      day: our_day.day
    }.to_json
  end
  
  before do
    @our_day = create(:our_day)
  end
  
  describe 'GET #index' do
    it 'returns all our_days' do
      another_our_day = create(:our_day)
      
      get :index, format: :json,
                  params: {our_day_id: @our_day}
                  
      expect(response.body).to include(our_day_json(@our_day))
      expect(response.body).to include(our_day_json(another_our_day))
    end
  end
  
  describe 'POST #create' do
    context 'when our_day is valid' do
      it 'renders our_days_json' do
        our_day_attrs = attributes_for(:our_day).with_indifferent_access
        our_day_attrs[:day] = our_day_attrs[:day].to_s
        
        post :create,
              format: :json,
              params: {our_day: our_day_attrs}
              
        expect(JSON.parse(response.body)).to include(our_day_attrs)
      end
    end
    context 'when our_day is not valid' do
      it 'render bad_reqest report' do
        post :create,
             format: :json,
             params: {our_day: attributes_for(:our_day, description: '')}
     
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  
  describe 'GET #show' do
    it 'render our_day json' do
      get :show, params: {id: @our_day},
                format: :json
                 
      expect(response.body).to eq(our_day_json(@our_day))
    end
  end
  
  describe 'PATCH #update' do
    context 'when our_day is valid' do
      before do
        post :update, format: :json,
                      params: {
                        method: :patch,
                        id: @our_day,
                        our_day: {description: 'Something'}
                      }
      end
      
      it 'updates our_day attributes' do
        expect(@our_day.reload.description).to eq('Something')
      end
      
      it 'renders our_day json' do
        expect(response.body).to eq(our_day_json(@our_day.reload))
      end
    end
    
    context 'when our_day is not valid' do
      it 'renders bad_reqest' do
        post :update, format: :json,
                      params:  {
                        method: :patch,
                        id: @our_day,
                        our_day: {description: ''}
                      }
        
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  
  describe 'DELETE #destroy' do
    before do 
      post :destroy, format: :json,
                     params: {
                       method: :destroy,
                       id: @our_day
                     }
    end
    
    it 'deletes our_day' do
      expect(OurDay.exists?(@our_day.id)).to be false
    end
    
    it 'response status ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
