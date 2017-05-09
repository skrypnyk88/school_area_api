class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
