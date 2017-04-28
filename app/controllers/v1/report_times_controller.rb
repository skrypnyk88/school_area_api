module V1
  class ReportTimesController < ApplicationController
    include Groupable
    before_action :find_presence_report
    before_action :find_report_time, only: [:update, :destroy]

    def create
      @report = @presence.report_times.new(report_params)
      if @report.save
        render :report_time
      else
        render json: { errors: @report.errors.full_messages }
      end
    end

    def update
      if @report.update(report_params)
        render :report_time
      else
        render json: { errors: @report.errors.full_messages }
      end
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def report_params
      params.require(:report_time).permit(:start_time, :end_time)
    end

    def find_report_time
      @report = @presence.report_times.find_by(id: params[:id])
      render json: { errors: 'Not found' }, status: :not_found unless @report
    end

    def find_presence_report
      @presence = @group.presence_reports.find(params[:presence_report_id])
      render json: { errors: 'Not found' }, status: :not_found unless @presence
    end
  end
end
