class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!

  def authenticate
    user = User.find_by(email: user_credentials[:email])
    if user && user.valid_password?(user_credentials[:password])
      head :ok, auth_token: JsonWebToken.encode(user)
    else
      head :unauthorized
    end
  end

  private

  def user_credentials
    params.require(:user).permit(:email, :password)
  end
end
