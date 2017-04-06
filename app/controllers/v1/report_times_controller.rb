module V1
  class ReportTimesController < ApplicationController
    before_action :find_report_time, only: [:update, :destroy]
    def index
      @report_times = Group.find(params[:group_id]).reporttimes
    end

    def show; end

    def create
      @report_time = ReportTime.new(report_params)
      render_show_or_bad_request(@report_time.save)
    end

    def update
      render_show_or_bad_request(@report_time.update(report_params))
    end

    def destroy
      @report_time.destroy
      head :no_content
    end

    private

    def find_report_time
      @report_time = ReportTime.find(params[:id])
      head :not_found unless @report_time
    end

    def render_show_or_bad_request(succeed)
      succeed ? (render :show) : (head :bad_request)
    end

    def report_params
      params.require(:report_time)
            .permit(:start_time, :end_time)
    end
  end
end
