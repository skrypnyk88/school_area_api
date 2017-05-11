class PasswordsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_user_by_token, only: [:reset]
  before_action :find_user_by_email, only: [:forgot]

  def forgot
    if @user
      @user.send_reset_info
      render json: { success: [I18n.t('mailer.email_sent')] }, status: :ok
    else
      render json: { errors: [I18n.t('mailer.errors.not_found')] },
             status: :not_found
    end
  end

  def reset
    if @user
      check_new_password
    else
      render json: { errors: [I18n.t('mailer.errors.invalid_token')] },
             status: :not_found
    end
  end

  private

  def set_user_language
    I18n.locale = @user&.locale || I18n.default_locale
  end

  def find_user_by_token
    @user = User.find_by(reset_password_token: user_params[:reset_token])
    set_user_language
  end

  def find_user_by_email
    @user = User.find_by(email: user_params[:email])
    set_user_language
  end

  def user_params
    params.require(:user)
          .permit(:email, :password, :password_confirmation, :reset_token)
  end

  def check_new_password
    if @user.reset_password(user_params[:password],
                            user_params[:password_confirmation])
      render json: { success: [I18n.t('mailer.password_reset')] }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end
end
