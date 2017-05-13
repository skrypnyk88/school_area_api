module V1
  class HealthReportsController < ApplicationController
    include Reportable

    def index
      @reports = reports_renderer(@students, HealthReport).call
    end

    def update
      @report = HealthReport.find_by(id: params[:id], student_id: @student_id)
      if @report.update(report_params)
        render :index
      else
        render json: { errors: @report.errors.full_messages },
               status: :bad_request
      end
    end

    private

    def report_params
      params.require(:report).permit(:health_note, :special_care)
    end
  end
end
