json.array!(@reports) do |report|
  json.extract! report, :id, :special_care, :health_note, :day
  json.student do
    json.partial! 'v1/students/student', locals: { student: report.student }
  end
end
