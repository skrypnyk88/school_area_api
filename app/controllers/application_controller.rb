class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = current_user.locale || I18n.default_locale
  end

  private

  def find_group
    @group = current_user.groups.find_by(id: params[:group_id])
    head :not_found unless @group
  end
end
