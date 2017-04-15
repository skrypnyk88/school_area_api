module V1
  class ReportTimesController < ApplicationController
    before_action :set_presence_report
    before_action :find_my_day_report, only: [:show, :update, :destroy]

    def index
      @reports = @presence.report_times
    end

    def show; end

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

    def find_my_day_report
      @report = @presence.report_times.find_by(id: params[:id])
    end

    def set_presence_report
      url_part = [PresenceReport]
                 .detect { |c| params["#{c.name.underscore}_id"] }
      @presence = url_part.find(params["#{url_part.name.underscore}_id"])
    end

    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
    end
  end
end
