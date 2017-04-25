module V1
  class BottleReportsController < ApplicationController
    include Reportable
    include CurrentUserGroup

    def index
      @bottle_reports = find_or_create_service(BottleReport)
      .find_or_create
    end
  end
end
