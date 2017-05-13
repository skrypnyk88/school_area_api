module V1
  class BottleReportsController < ApplicationController
    include Reportable

    def index
      @bottle_reports = reports_renderer(@students, BottleReport).call
    end
  end
end
