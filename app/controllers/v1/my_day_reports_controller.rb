module V1
  class MyDayReportsController < ApplicationController
    before_action :find_my_day_report, only: [:show, :update, :destroy]

    def index
      @reports = Group.find(params[:group_id]).my_day_reports
      @students = Group.find(params[:group_id]).students
    end

    def show; end

    def create
      @report = MyDayReport.new(report_params)
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
      params.require(:report).permit(:day, :note)
    end

    def find_my_day_report
      @report = MyDayReport.find_by(id: params[:id],
                                    group_id: params[:group_id])
      head :not_found unless @report
    end

    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
    end
  end
end
