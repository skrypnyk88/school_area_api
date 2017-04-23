module V1
  class BottleReportsController < ApplicationController
    include Reportable
    include Searching

    def index
      @bottle_reports = create_service(BottleReport).find_or_create
    end
  end
end
