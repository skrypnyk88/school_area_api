json.array! @reports do |report|
  json.student report.student, :id, :first_name, :last_name
  json.my_day_report report, :id, :note
end
