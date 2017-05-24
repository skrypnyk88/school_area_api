module V1
  class NapReportsController < ApplicationController
    include Reportable

    def index
      @nap_reports = reports_renderer(@students, NapReport).call
    end
  end
end
