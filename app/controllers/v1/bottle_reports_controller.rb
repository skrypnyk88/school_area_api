module V1
  class BottleReportsController < ApplicationController
    before_action :fill_group, :fill_day

    def index
      @day.nil? ? find_by_group : find_by_group_and_day
    end

    private

    def find_by_group_and_day
      @bottle_reports = @group.bottle_reports
                              .includes(:bottles)
                              .where(day: @day)
    end

    def find_by_group
      @bottle_reports = @group.bottle_reports.includes(:bottles)
    end

    def fill_group
      @group = Group.find_by id: params[:group_id]
      head :not_found if @group.nil?
    end

    def fill_day
      @day = Date.parse(params[:day]) unless params[:day].nil?
    end
  end
end
