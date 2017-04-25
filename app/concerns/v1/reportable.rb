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

    def find_or_create_service(model)
      ReportCreator.new(day: @day, group: @group, model: model)
    end
  end
end
