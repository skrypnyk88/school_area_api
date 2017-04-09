require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #authenticate' do
    context 'when user credentials are correct' do
      it 'adds auth_token header' do
        post :authenticate, format: :json,
                            params: {
                              user: {
                                email: user.email,
                                password: user.password
                              }
                            }

        expect(response.headers).to include('Auth-Token')
      end
    end

    context 'when user credentials are not correct' do
      it 'has status :unauthorized' do
        post :authenticate, format: :json,
                            params: {
                              user: {
                                email: user.email,
                                password: user.password * 2
                              }
                            }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
