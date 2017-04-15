module V1
  class GroupsController < ApplicationController
    before_action :find_group, only: [:show, :update, :destroy]

    def index
      @groups = current_user.groups
    end

    def create
      @group = current_user.groups.create(group_params)
      render_show_or_bad_request(@group.save)
    end

    def show; end

    def update
      render_show_or_bad_request(@group.update(group_params))
    end

    def destroy
      @group.destroy
      head :no_content
    end

    private

    def render_show_or_bad_request(succeed)
      succeed ? (render :show) : (head :bad_request)
    end

    def group_params
      params.require(:group).permit(:name)
    end
  end
end
