require 'rails_helper'

RSpec.describe V1::TeachersController, type: :controller do
  render_views

  def teacher_params(teacher)
    teacher.attributes
           .with_indifferent_access
           .extract!(:id, :first_name, :last_name, :email, :phone, :locale)
  end

  let(:current_user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'GET #show' do
    it 'returns only current user' do
      get :show, params: { id: current_user },
                 format: :json
      expect(response.body).to eq(teacher_params(current_user).to_json)
    end
  end

  describe 'PATCH #update' do
    context 'when teacher is valid' do
      let(:valid_params) do
        { method: :patch,
          id: current_user,
          teacher: { locale: 'ua' } }
      end

      it 'updates teacher attributes' do
        post :update, format: :json,
                      params: valid_params

        expect(current_user.reload.locale)
          .to eq(valid_params[:teacher][:locale])
      end
    end
  end
end
