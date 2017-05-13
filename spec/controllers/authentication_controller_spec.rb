require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.encode(user) }
  let(:valid_token_header) { { authorization: token } }
  let(:invalid_token_header) { { authorization: token * 2 } }
  let(:unauthenticated_errors) do
    { errors: [I18n.t('errors.unauthenticated')] }
  end

  let(:token_timeout_errors) do
    { errors: [I18n.t('errors.token_timeout')] }
  end

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

      it 'returns error messages' do
        post :authenticate, format: :json,
                            params: {
                              user: {
                                email: user.email,
                                password: user.password * 2
                              }
                            }

        expect(response.body).to eq(unauthenticated_errors.to_json)
      end
    end
  end

  describe 'GET #refresh_token' do
    context 'when old token is valid' do
      it 'returns new token' do
        request.headers.merge! valid_token_header
        allow(JsonWebToken).to receive(:encode).and_return('new-token')

        get :refresh_token, format: :json

        expect(response.headers['Auth-Token']).to eq('new-token')
      end
    end

    context 'when old token is not valid' do
      it 'has status 419' do
        request.headers.merge! invalid_token_header

        get :refresh_token, format: :json

        expect(response).to have_http_status(419)
      end

      it 'returns error messages' do
        request.headers.merge! invalid_token_header

        get :refresh_token, format: :json

        expect(response.body).to eq(token_timeout_errors.to_json)
      end
    end
  end
end
