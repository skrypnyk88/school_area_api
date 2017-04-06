module V1
  class PresenceReportsController < ApplicationController
    def index
      @presence_reports = PresenceReport.all
    end

    def show; end

    def create
      @presence_report = PresenceReport.new(report_params)
      if @presence_report.save
        render json: :show, status: :created
      else
        head :bad_request
      end
      @presence_report.save
    end

    def update
      @presence_report = PresenceReport.find(params[:id])
      @presence_report.update_attributes(report_params)
      if @presence_report.save
        render json: :show, status: :created
      else
        head :bad_request
      end
      @presence_report.save
    end

    def destroy
      @presence_report = PresenceReport.find(params[:id])
      @presence_report.destroy
    end

    def report_params
      params.require(:presence_report).permit(:day)
    end
  end
end
