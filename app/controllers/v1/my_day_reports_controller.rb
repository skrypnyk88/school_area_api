module V1
  class MyDayReportsController < ApplicationController
    def index
      @reports = Group.find(params[:group_id]).my_day_reports
      @students = Group.find(params[:group_id]).students
    end

    def create
      @report = MyDayReport.new(report_params)
      render_json_or_exception(@report.save, :create)
    end

    def update
      @report = MyDayReport.find_by(id: params[:id],
                                    group_id: params[:group_id])
      head :not_found unless @report
      render_json_or_exception(@report.update(report_params), :update)
    end

    private

    def report_params
      params.require(:report).permit(:day, :note)
    end

    def find_students
      @students = Group.find(params[:group_id]).students
    end

    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
    end
  end
end
