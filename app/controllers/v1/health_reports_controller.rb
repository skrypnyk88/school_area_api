module V1
  class HealthReportsController < ApplicationController
    def show
      @reports = HealthReport.find(params[:id])
    end

    def index
      @reports = HealthReport.all
    end

    def create
      @reports = HealthReport.new(report_params)
      if @reports.save
        render json: @reports, status: :created
      else
        render json: @reports.errors, status: :unprocessable_entity
      end
    end

    def update
      @report = HealthReport.find(params[:id])
      if @report.update(report_params)
        head :no_content
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @report = HealthReport.find(params[:id])
      @report.destroy
      head :no_content
    end

    private

    def report_params
      params.require(:reports).permit(:health_note, :special_care, :day)
    end
  end
end
