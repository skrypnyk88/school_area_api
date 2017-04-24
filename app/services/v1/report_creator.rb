module V1
  class ReportCreator
    def initialize(day:, group:, model:)
      @day = day
      @group = group
      @model = model
    end

    attr_reader: group, model, day

    def find_or_create
      group.students.map do |student|
        model.find_or_create_by(day: day,
                                group: group,
                                student: student)
      end
    end
  end
end
