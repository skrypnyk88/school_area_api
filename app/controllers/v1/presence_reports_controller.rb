module V1
  class PresenceReportsController < ApplicationController
    before_action :find_group, only: [:index]

    def index
      @reports = @group.presence_reports
      @students = @group.students
    end

    def create
      @report = PresenceReport.new(report_params)
      render_json_or_exception(@report.save, :create)
    end

    private

    def report_params
      params.require(:report).permit(:day)
    end

    def find_presence_report
      @report = PresenceReport.find_by(id: params[:id],
                                       group_id: params[:group_id])
      head :not_found unless @report
    end

    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
    end
  end
end
