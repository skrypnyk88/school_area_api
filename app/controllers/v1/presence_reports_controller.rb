module V1
  class PresenceReportsController < ApplicationController
<<<<<<< 85309f794ef111fce370c679a0b7e9ec681d373e
<<<<<<< 6b426f725b27b5ae5adb7f602876ca02cc82fe0d
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
    include Groupable
    include Reportable

    def index
      @reports = reports_renderer(@group.students, PresenceReport).call
=======
=======
    before_action :find_presence_report, only: [:update, :destroy]
>>>>>>> LVRUBYM-219: Fixed
    def index
      @presence_reports = PresenceReport.all
>>>>>>> LVRUBYM-190: User actions on backend
=======
    before_action :find_presence_report, only: [:update, :destroy]
=======
    before_action :find_presence_report, only: [:show, :destroy]
=======
    before_action :find_group, only: [:index]
>>>>>>> LVRUBYM-191: rebase master branch
=======
    before_action :find_group, only: [:index]
>>>>>>> LVRUBYM-191: rebase master branch

>>>>>>> LVRUBYM-219: add ReportTimesController
    def index
<<<<<<< 85309f794ef111fce370c679a0b7e9ec681d373e
<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c
      @reports = Group.find(params[:group_id]).presence_reports
=======
      @reports = @group.presence_reports
      @students = @group.students
>>>>>>> LVRUBYM-191: rebase master branch
=======
    before_action :find_presence_report, only: [:show, :destroy]

    def index
      @reports = Group.find(params[:group_id]).presence_reports
>>>>>>> LVRUBYM-219: add ReportTimesController
=======
      @reports = @group.presence_reports
      @students = @group.students
>>>>>>> LVRUBYM-191: rebase master branch
    end

    def show; end

    def create
<<<<<<< 6b426f725b27b5ae5adb7f602876ca02cc82fe0d
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
      @report = PresenceReport.new(report_params)
      render_json_or_exception(@report.save, :create)
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def report_params
      params.require(:report).permit(:day)
    end

    def find_presence_report
      @report = PresenceReport.find_by(id: params[:id],
                                       group_id: params[:group_id])
      head :not_found unless @report
=======
      @presence_report = PresenceReport.new(report_params)
      render_show_or_bad_request(@presence_report.save)
    end

    def update
      render_show_or_bad_request(@presence_report.update(report_params))
=======
      @report = PresenceReport.new(report_params)
      render_json_or_exception(@report.save, :create)
>>>>>>> LVRUBYM-219: add ReportTimesController
    end

    def destroy
      @report.destroy
      head :no_content
    end

    private

    def report_params
      params.require(:report).permit(:day)
    end

<<<<<<< 6b426f725b27b5ae5adb7f602876ca02cc82fe0d
    def render_show_or_bad_request(succeed)
      succeed ? (render :show) : (head :bad_request)
>>>>>>> LVRUBYM-219: Fixed
    end

<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
    def report_params
      params.require(:presence_report).permit(:day)
>>>>>>> LVRUBYM-219: Fixed
=======
    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
>>>>>>> LVRUBYM-219: add ReportTimesController
=======
    def index
      @presence_reports = PresenceReport.all
>>>>>>> LVRUBYM-190: User actions on backend
=======
    def find_presence_report
      @report = PresenceReport.find_by(id: params[:id],
                                       group_id: params[:group_id])
      head :not_found unless @report
    end

    def render_json_or_exception(condition, json_file)
      condition ? (render json_file) : (head :bad_request)
>>>>>>> LVRUBYM-219: add ReportTimesController
    end
  end
end
