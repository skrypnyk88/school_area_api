module V1
  class BottleReportsController < ApplicationController
    include Reportable
    include Groupable

    def index
      @bottle_reports = reports_renderer(@students, BottleReport).call
    end
  end
end
