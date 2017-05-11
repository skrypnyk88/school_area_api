module V1
  module Reportable
    extend ActiveSupport::Concern

    included do
      include Groupable
      before_action :set_day
      before_action :find_present_students
    end

    private

    def set_day
      @day = params[:day] ? Date.parse(params[:day]) : Date.today
    end

    def find_present_students
      @students = @group.students.present(@day)
    end

    def reports_renderer(students, model)
      ReportsRenderer.new(day: @day, students: students, model: model)
    end
  end
end
