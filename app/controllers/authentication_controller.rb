class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!, only: :authenticate
  skip_before_action :set_locale
  def authenticate
    user = User.find_by(email: user_credentials[:email])
    if user && user.valid_password?(user_credentials[:password])
      send_token_header(user)
    else
      head :unauthorized
    end
  end

  def refresh_token
    send_token_header(current_user)
  end

  private

  def send_token_header(user)
    head :ok, auth_token: JsonWebToken.encode(user)
  end

  def user_credentials
    params.require(:user).permit(:email, :password)
  end
end
