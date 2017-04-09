module V1
  class BottleReportsController < ApplicationController
    before_action :find_group_bottle_reports, only: [:index]

    def index; end

    def show
      date = Date.parse(params[:day])
      @bottle_reports = BottleReport.where(day: date,
                                           group_id: params[:group_id])
    end

    def destroy
      @bottle_report = BottleReport.find_by id: params[:id]
      render :not_found if @bottle_report.nil?
      @bottle_report.destroy
      head :ok
    end

    private

    def find_group_bottle_reports
      group = Group.find_by id: params[:group_id]
      render :not_found if group.nil?
      @bottle_reports = group.bottle_reports
    end
  end
end
