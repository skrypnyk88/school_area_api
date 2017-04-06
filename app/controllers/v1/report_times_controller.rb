module V1
  class ReportTimesController < ApplicationController
    def index
      @report_times = ReportTime.all
    end

    def show; end

    def create
      @report_time = ReportTime.new(report_params)
      if @report_time.save
        render json: :show, status: :created
      else
        head :bad_request
      end
      @report_time.save
    end

    def update
      @report_time = ReportTime.find(params[:id])
      @report_time.update_attributes(report_params)
      if @report_time.save
        render json: :show, status: :created
      else
        head :bad_request
      end
      @report_time.save
    end

    def destroy
      @report_time = ReportTime.find(params[:id])
      @report_time.destroy
    end

    def report_params
      params.require(:report_time)
            .permit(:start_time, :end_time, :reportable_id, :reportable_type)
    end
  end
end
