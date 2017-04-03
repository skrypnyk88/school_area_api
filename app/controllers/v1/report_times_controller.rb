module V1
  class ReportTimesController < ApplicationController
    def index
      @report_times = ReportTime.all
    end

    def create
      @report_time = ReportTime.new(report_params)
      if @report_time.save
        render 'create.json.jbuilder'
      else
        render json: { error: 'Incorrect data' }
      end
      @report_time.save
    end

    def update
      @report_time = ReportTime.find(params[:id])
      @report_time.update_attributes(report_params)
      if @report_time.save
        render 'update.json.jbuilder'
      else
        render json: { error: 'Incorrect data' }
      end
      @report_time.save
    end

    def destroy
      @report_time = ReportTime.find(params[:id])
      @report_time.destroy
    end

    def report_params
      params.require(:report_time).permit(:start_time, :end_time)
    end
  end
end
