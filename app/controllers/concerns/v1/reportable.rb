module V1
  module Reportable
    extend ActiveSupport::Concern

    included do
      before_action :set_day
    end

    private

    def set_day
      @day = params[:day] ? Date.parse(params[:day]) : DateTime.now
    end

    def reports_renderer(students, model)
      ReportsRenderer.new(day: @day, students: students, model: model)
    end
  end
end
