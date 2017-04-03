module V1
  class PresenceReportsController < ApplicationController
    def index
      @presence_reports = PresenceReport.all
    end
  end
end
