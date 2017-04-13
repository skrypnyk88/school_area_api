json.array! @reports do |report|
  json.first_name report.student.first_name
  json.last_name report.student.last_name
  json.my_day_report_id report.id
  json.my_day_report_note report.note
end
