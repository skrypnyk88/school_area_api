module V1
  class MyDayReportsController < ApplicationController
    def index
      @reports = Group.find(params[:group_id]).my_day_reports
      @students = Group.find(params[:group_id]).students
    end

    def update
      @report = MyDayReport.find_by(id: params[:id],
                                    group_id: params[:group_id])
      head :not_found unless @report
      @report.update(report_params) ? (render :update) : (head :bad_request)
    end

    private

    def report_params
      params.require(:report).permit(:day, :note)
    end
  end
end
