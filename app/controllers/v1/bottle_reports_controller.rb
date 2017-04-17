module V1
  class BottleReportsController < ApplicationController
    before_action :find_group

    def index
      search_params = params[:day] ? { day: Date.parse(params[:day]) } : {}
      @bottle_reports = @group.bottle_reports
                              .includes(:bottles).where(search_params)
    end
  end
end
