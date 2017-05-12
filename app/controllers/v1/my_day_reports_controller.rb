module V1
  class MyDayReportsController < ApplicationController
    include Reportable
    include Groupable

    def index
      @reports = reports_renderer(@students, MyDayReport).call
    end

    def update
      @report = MyDayReport.find_by(id: params[:id], group_id: @group)
      if @report.update_attributes(report_params)
        render :update
      else
        render json: { errors: @report.errors.full_messages },
               status: :bad_request
      end
    end

    private

    def report_params
      params.require(:report).permit(:day, :note)
    end
  end
end
