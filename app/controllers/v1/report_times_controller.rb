module V1
  class ReportTimesController < ApplicationController
    before_action :find_presence_report
    before_action :find_report_time, only: [:show, :update, :destroy]

    def create
      @report = @presence.report_times.new(report_params)
      render_json_or_exception(@report.save, :create)
    end

    def update
      render_json_or_exception(@report.update(report_params), :update)
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def report_params
      params.require(:report_time).permit(:start_time, :end_time)
    end

    def find_report_time
      @report = @presence.report_times.find_by(id: params[:id])
    end

    def find_presence_report
      @presence = PresenceReport.find(params[:presence_report_id])
    end

    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
    end
  end
end
