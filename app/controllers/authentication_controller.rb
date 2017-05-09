class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!, only: :authenticate

  def authenticate
    user = User.find_by(email: user_credentials[:email])
    if user && user.valid_password?(user_credentials[:password])
      send_response(user)
    else
      head :unauthorized
    end
  end

  def refresh_token
    send_response(current_user)
  end

  private

  def send_response(user)
    response.headers['Auth-Token'] = JsonWebToken.encode(user)
    @current_user = user
    render 'v1/users/show', status: :ok
  end

  def user_credentials
    params.require(:user).permit(:email, :password)
  end
end
