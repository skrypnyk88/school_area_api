module V1
  class PresenceReportsController < ApplicationController
    before_action :find_presence_report, only: [:show, :destroy]

    def index
      #@reports = PresenceReport.all
      @reports = Group.find(params[:group_id]).presence_reports
      @students = Group.find(params[:group_id]).students
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
