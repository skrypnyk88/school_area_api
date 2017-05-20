json.array! @reports do |report|
  json.extract! report, :id, :note
  json.student do
    json.partial! 'v1/students/student', locals: { student: report.student }
  end
end
