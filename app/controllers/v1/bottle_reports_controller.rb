module V1
  class BottleReportsController < ApplicationController
    before_action :find_group, :set_day

    def index

      @bottle_reports = BottleReportService.new(@day, @group.id)
      .find_or_create_bottle_report
    end
  end
end
