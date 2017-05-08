module V1
  class MyDayReportsController < ApplicationController
    include Groupable
    include Reportable

    def index
      @reports = reports_renderer(@group.students, MyDayReport).call
    end

    def update
      @report = MyDayReport.find_by(id: params[:id])
      if @report.nil?
        head :not_found
      elsif @report.update(report_params)
        render :update
      else
        render json: { errors: @report.errors.full_messages },
               status: 400
      end
    end

    private

    def report_params
      params.require(:report).permit(:day, :note)
    end
  end
end
