class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def find_group
    @findgroup = current_user.groups.find_by(id: params[:id])
    head :not_found unless @findgroup
  end
end
