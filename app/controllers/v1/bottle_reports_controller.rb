module V1
  class BottleReportsController < ApplicationController
    include Reportable
    include CurrentUserGroup

    def index
      @bottle_reports = create_service(BottleReport).find_or_create
    end
  end
end
