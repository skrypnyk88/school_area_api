class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def find_group
    @group = current_user.groups.find_by(id: params[:group_id])
    head :not_found unless @group
  end

  def set_day
    @day = params[:day] ? Date.parse(params[:day]) : DateTime.now
  end
end
