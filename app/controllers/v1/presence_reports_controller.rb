module V1
  class PresenceReportsController < ApplicationController
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
    def index
      @presence_reports = PresenceReport.all
    end

    def show; end

    def create
      @presence_report = PresenceReport.new(report_params)
      render_show_or_bad_request(@presence_report.save)
    end

    def update
      render_show_or_bad_request(@presence_report.update(report_params))
    end

    def destroy
      @presence_report.destroy
      head :no_content
    end

    private

    def find_presence_report
      @presence_report = PresenceReport.find(params[:id])
      head :not_found unless @presence_report
    end

    def render_show_or_bad_request(succeed)
      succeed ? (render :show) : (head :bad_request)
    end

    def report_params
      params.require(:presence_report).permit(:day)
>>>>>>> LVRUBYM-219: Fixed
    end
  end
end
