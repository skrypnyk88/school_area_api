module V1
  class ReportsRenderer
    def initialize(day:, students:, model:)
      @day = day
      @students = students
      @model = model
    end

    attr_reader :students, :model, :day

    def call
      students.map do |student|
        model.find_or_create_by(day: day,
                                group: student.group,
                                student: student)
      end
    end
  end
end
