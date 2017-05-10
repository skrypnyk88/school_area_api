json.array! @reports do |report|
  json.extract! report, :id, :note
  json.student report.student, :id, :first_name, :last_name
end
