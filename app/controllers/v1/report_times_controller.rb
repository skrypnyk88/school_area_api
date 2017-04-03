module V1
  class ReportTimesController < ApplicationController
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
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
      render json: { errors: "Report Time doesn't exist" }, status: :not_found
    end

    def find_presence_report
      @presence = @group.presence_reports
                        .find_by(id: params[:presence_report_id])
      return if @presence
      render json: { errors: "PresenceReport doesn't exist" },
             status: :not_found
    end
=======
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
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
