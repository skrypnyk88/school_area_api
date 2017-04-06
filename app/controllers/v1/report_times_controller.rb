module V1
  class ReportTimesController < ApplicationController
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
<<<<<<< 72d59ee036847a4966334687cc75c280e5f58758
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
=======
>>>>>>> LVRUBYM-219: Fixed controller and tests
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
<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c
      if @report.update(report_params)
        render :report_time
      else
        render json: { errors: @report.errors.full_messages }
      end
=======
      render_json_or_exception(@report.update_attributes(report_params),
                               :update)
      @report.save
>>>>>>> LVRUBYM-191: rebase master branch
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def report_params
<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c
      params.require(:report_time).permit(:start_time, :end_time)
=======
      params.require(:report_time).permit(:id, :start_time, :end_time)
>>>>>>> LVRUBYM-191: rebase master branch
    end

    def find_report_time
      @report = @presence.report_times.find_by(id: params[:id])
<<<<<<< 72d59ee036847a4966334687cc75c280e5f58758
      return if @report
      render json: { errors: "Report Time doesn't exist" }, status: :not_found
    end

    def find_presence_report
      @presence = @group.presence_reports
                        .find_by(id: params[:presence_report_id])
      return if @presence
      render json: { errors: "PresenceReport doesn't exist" },
             status: :not_found
=======
      render json: { errors: 'Not found' }, status: :not_found unless @report
    end

    def find_presence_report
      @presence = @group.presence_reports.find(params[:presence_report_id])
      render json: { errors: 'Not found' }, status: :not_found unless @presence
>>>>>>> LVRUBYM-219: Fixed controller and tests
    end
=======
=======
    before_action :find_report_time, only: [:update, :destroy]
>>>>>>> LVRUBYM-219: Fixed
=======
    before_action :set_presence_report
    before_action :find_my_day_report, only: [:show, :update, :destroy]

>>>>>>> LVRUBYM-219: add ReportTimesController
    def index
      @reports = @presence.report_times
=======
    before_action :find_report_time, only: [:update, :destroy]
    def index
      @report_times = Group.find(params[:group_id]).reporttimes
>>>>>>> LVRUBYM-219: Fixed
    end

    def create
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
      @report_time = ReportTime.new(report_params)
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
=======
    def index
      @report_times = ReportTime.all
    end

    def create
      @report_time = ReportTime.new(report_params)
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
>>>>>>> LVRUBYM-190: User actions on backend
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
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
=======
      render_show_or_bad_request(@report_time.save)
    end

    def update
      render_show_or_bad_request(@report_time.update(report_params))
>>>>>>> LVRUBYM-219: Fixed
=======
      @report = @presence.report_times.new(report_params)
      render_json_or_exception(@report.save, :create)
    end

    def update
      render_json_or_exception(@report.update(report_params), :update)
>>>>>>> LVRUBYM-219: add ReportTimesController
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def report_params
      params.require(:report_time).permit(:start_time, :end_time)
    end

    def find_my_day_report
      @report = @presence.report_times.find_by(id: params[:id])
    end

<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
    def report_params
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
      params.require(:report_time).permit(:start_time, :end_time)
=======
      params.require(:report_time)
            .permit(:start_time, :end_time)
>>>>>>> LVRUBYM-219: Fixed
=======
    def set_presence_report
      url_part = [PresenceReport]
                 .detect { |c| params["#{c.name.underscore}_id"] }
      @presence = url_part.find(params["#{url_part.name.underscore}_id"])
    end

    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
>>>>>>> LVRUBYM-219: add ReportTimesController
    end
>>>>>>> LVRUBYM-190: User actions on backend
=======
=======
      render_show_or_bad_request(@report_time.save)
    end

    def update
      render_show_or_bad_request(@report_time.update(report_params))
>>>>>>> LVRUBYM-219: Fixed
    end

    def destroy
      @report_time.destroy
      head :no_content
    end

    private

    def find_report_time
      @report_time = ReportTime.find(params[:id])
      head :not_found unless @report_time
    end

    def render_show_or_bad_request(succeed)
      succeed ? (render :show) : (head :bad_request)
    end

    def report_params
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
      params.require(:report_time).permit(:start_time, :end_time)
=======
      params.require(:report_time)
            .permit(:start_time, :end_time)
>>>>>>> LVRUBYM-219: Fixed
    end
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
