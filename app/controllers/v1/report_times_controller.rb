module V1
  class ReportTimesController < ApplicationController
    include Groupable

    before_action :find_report
    before_action :find_report_time, only: [:update, :destroy]

    def create
      @report_time = @report.report_times.new(report_time_params)
      if @report_time.save
        render :report_time
      else
        render json: { errors: @report_time.errors.full_messages },
               status: :bad_request
      end
    end

    def update
      if @report_time.update_attributes(report_time_params)
        render :report_time
      else
        render json: { errors: @report_time.errors.full_messages },
               status: :bad_request
      end
    end

    def destroy
      @report_time.destroy
      head :ok
    end

    private

    def report_time_params
      params.require(:report_time).permit(:start_time, :end_time)
    end

    def find_report
      url_part = [PresenceReport, NapReport]
                 .detect { |c| params["#{c.name.underscore}_id"] }
      @report = url_part.find_by(id: params["#{url_part.name.underscore}_id"],
                                 group_id: @group)
      return if @report
      render json: { errors: [I18n.t('report_time.errors.not_found_report')] },
             status: :not_found
    end

    def find_report_time
      @report_time = @report.report_times.find_by id: params[:id]
      head :not_found unless @report_time
      return if @report_time
      render json: { errors: [I18n.t('report_time.errors.not_found')] },
             status: :not_found
    end
  end
end
