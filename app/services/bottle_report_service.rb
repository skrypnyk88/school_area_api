module V1
  class BottleReportService
    def initialize(day, group_id)
      @day = day
      @group_id = group_id
    end

    def find_or_create_bottle_report
      group = Group.includes(:students).find_by id: @group_id
      bottle_reports = group.students
                            .map { |student| BottleReport.find_or_create_by(
                                                           day: @day,
                                                           group_id: @group_id,
                                                           student_id: student.id ) }
    end
  end
end
