module V1
  class HealthReportsController < ApplicationController
    before_action :set_group
    before_action :set_report, only: [:update]

    def index
      @reports = @group.health_reports.order('id asc')
      @students = @group.students
    end

    def update
      if @report.update(report_params)
        head :no_content
      else
        bad_reqest
      end
    end

    private

    def set_report
      @report = @group.health_reports.find_by(id: params[:id])
    end

    def set_group
      @group = Group.find_by(id: params[:group_id])
      head :not_found unless @group
    end

    def report_params
      params.require(:report).permit(:health_note,
                                     :special_care,
                                     :day,
                                     :student_id)
    end

    def bad_reqest
      render json: @report.errors, status: :bad_request
    end
  end
end