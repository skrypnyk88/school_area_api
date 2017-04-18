module V1
  class OurDaysController < ApplicationController
    before_action :find_group
    before_action :find_our_day, only: [:show, :update]

    def create
      @our_day = @group.our_days.build(our_day_params)
      render_show_or_bad_request(@our_day.save)
    end

    def show; end

    def update
      render_show_or_bad_request(@our_day.update(our_day_params))
    end

    private

    def find_group
      @group = Group.find_by(id: params[:group_id])
      head :bad_request unless @group
    end

    def find_our_day
      @our_day = @group.our_days.find_by(id: params[:id])
      head :bad_request unless @our_day
    end

    def render_show_or_bad_request(succeed)
      succeed ? (render :show) : (head :bad_request)
    end

    def our_day_params
      params.require(:our_day).permit(:description, :day)
    end
  end
end
