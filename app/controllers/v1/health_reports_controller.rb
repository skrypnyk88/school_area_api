module V1
  class HealthReportsController < ApplicationController
    before_action :set_report, only: [:show, :update, :destroy]

    def show; end

    def index
      @reports = HealthReport.all
    end

    def create
      @reports = HealthReport.new(report_params)
      if @reports.save
        render json: :show, status: :created
      else
        render json: @reports.errors, status: :unprocessable_entity
      end
    end

    def update
      if @report.update(report_params)
        head :no_content
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def set_report
      @report = HealthReport.find(params[:id])
    end

    def report_params
      params.require(:reports).permit(:health_note, :special_care, :day)
    end
  end
end
