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
      return if @report
      render json: { errors: [I18n.t('report_time.errors.not_found')] }, status: :not_found
    end

    def find_presence_report
      @presence = @group.presence_reports
                        .find_by(id: params[:presence_report_id])
      return if @presence
      render json: { errors: [I18n.t('presence_report.errors.not_found')] },
             status: :not_found
    end
  end
end
