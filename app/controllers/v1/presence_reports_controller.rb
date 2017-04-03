module V1
  class PresenceReportsController < ApplicationController
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

>>>>>>> LVRUBYM-219: add ReportTimesController
    def index
<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c
      @reports = Group.find(params[:group_id]).presence_reports
=======
      @reports = @group.presence_reports
      @students = @group.students
>>>>>>> LVRUBYM-191: rebase master branch
    end

    def show; end

    def create
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
    end
  end
end
