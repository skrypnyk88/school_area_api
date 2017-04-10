module V1
  class BottleReportsController < ApplicationController
    before_action :check_day, :find_group, :find_bottle_reports

    def index
      @day.nil? ? find_by_group : find_by_group_and_day
    end

    private

    def find_by_group_and_day
      @bottle_reports = BottleReport.where(day: @day,
                                           group_id: params[:group_id])
    end

    def find_by_group
      @bottle_reports = BottleReport.where(group_id: params[:group_id])
    end

    def check_day
      @day = Date.parse(params[:day]) unless params[:day].nil?
    end

    def find_group
      @group = Group.find_by id: params[:group_id]
      render :not_found if @group.nil?
    end

    def find_bottle_reports
      @bottle_reports = @group.bottle_reports
    end
  end
end
