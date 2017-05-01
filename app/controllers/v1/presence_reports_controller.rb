module V1
  class PresenceReportsController < ApplicationController
    include Groupable
    include Reportable

    def index
      @reports = reports_renderer(@group.students, PresenceReport).call
    end
  end
end
