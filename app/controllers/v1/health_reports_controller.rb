module V1
  class HealthReportsController < ApplicationController
    before_action :set_report, only: [:show, :update, :destroy]

    def show; end

    def index
      @reports = Group.find(params[:group_id]).health_reports
    end

    def create
      @report = HealthReport.new(report_params)
      if @report.save
        render :show, status: :created
      else
        bad_reqest
      end
    end

    def update
      if @report.update(report_params)
        head :no_content
      else
       bad_reqest
      end
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def set_report
      @report = HealthReport.find_by(id: params[:id])
      head :not_found if @report.nil?
    end

    def report_params
      params.require(:report).permit(:health_note, :special_care, :day)
    end

    def bad_reqest
      render json: @report.errors, status: :unprocessable_entity
    end
  end
end
