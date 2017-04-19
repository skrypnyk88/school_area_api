class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def group
    @group = current_user.groups.find_by(id: params[:group_id])
    head :not_found unless @group
  end
end
