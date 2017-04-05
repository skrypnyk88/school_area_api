module V1
  class HealthReportsController < ApplicationController
    before_action :set_report, only: [:show, :update, :destroy]

    def show; end

    def index
      @report = HealthReport.all
    end

    def create
      @report = HealthReport.new(report_params)
      if @report.save
        render json: :show, status: :created
      else
        render json: @report.errors, status: :unprocessable_entity
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
      if HealthReport.exists?(params[:id])
        @report = HealthReport.find_by_id(params[:id])
      else
        head :not_found
      end
    end

    def report_params
      params.require(:report).permit(:health_note, :special_care, :day)
    end
  end
end
