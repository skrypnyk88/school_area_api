json.array!(@reports) do |report|
  json.report report, :id, :special_care, :health_note, :day
  json.student do
    json.partial! 'v1/students/student', locals: { student: report.student }
  end
end
