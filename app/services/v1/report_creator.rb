module V1
  class ReportCreator
    def initialize(day:, group:, model:)
      @day = day
      @group = group
      @model = model
    end

    def get_reports
      bottle_reports = find_or_create
    end

    private

    def find_or_create
      @group.students.map { |student| @model
                                      .find_or_create_by(day: @day,
                                                         group: @group,
                                                         student: student) }
    end
  end
end
