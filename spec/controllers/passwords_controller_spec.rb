require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #forgot' do
    context 'when user email is correct' do
      it 'sends reset password instructions' do
        expect_any_instance_of(User).to receive(:send_reset_info)
        post :forgot, format: :json,
                      params: {
                        user: {
                          email: user.email
                        }
                      }
      end
      it 'has status 200 ok' do
        post :forgot, format: :json,
                      params: {
                        user: {
                          email: user.email
                        }
                      }

        expect(response).to have_http_status(:ok)
      end
    end
    context 'when user email is not correct' do
      it 'has status not found' do
        post :forgot, format: :json,
                      params: {
                        user: {
                          email: 'incorrect@@email.com'
                        }
                      }

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #reset' do
    context "when user's token is correct" do
      it 'resets password' do
        user.send_reset_info
        expect_any_instance_of(User).to receive(:reset_password)
        post :reset, format: :json,
                     params: {
                       user: {
                         reset_token: user.reset_password_token,
                         password: '1234567',
                         password_confirmation: '1234567'
                       }
                     }
      end
      it 'has status 200 ok' do
        user.send_reset_info
        post :reset, format: :json,
                     params: {
                       user: {
                         reset_token: user.reset_password_token,
                         password: '1234567',
                         password_confirmation: '1234567'
                       }
                     }
        expect(response).to have_http_status(:ok)
      end
    end
    context "when user's token is not correct" do
      it 'has status not_found' do
        user.send_reset_info
        post :reset, format: :json,
                     params: {
                       user: {
                         reset_token: user.reset_password_token + '5',
                         password: '1234567',
                         password_confirmation: '1234567'
                       }
                     }
        expect(response).to have_http_status(:not_found)
      end
    end
    context "when user's password, password_confirmation are valid" do
      it 'has status 200 ok' do
        user.send_reset_info
        post :reset, format: :json,
                     params: {
                       user: {
                         reset_token: user.reset_password_token,
                         password: '1234567',
                         password_confirmation: '1234567'
                       }
                     }
        expect(response).to have_http_status(:ok)
      end
    end
    context "when user's password, password_confirmation are not valid" do
      it 'has status bad_request' do
        user.send_reset_info
        post :reset, format: :json,
                     params: {
                       user: {
                         reset_token: user.reset_password_token,
                         password: '1',
                         password_confirmation: '1'
                       }
                     }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
