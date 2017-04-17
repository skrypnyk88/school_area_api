json.array! @reports do |report|
  json.health_id report.id
  json.special_care report.special_care
  json.health_note report.health_note
  json.day report.day
end

json.array! @reports do |report|
  json.id report.student.id
  json.first_name report.student.first_name
  json.last_name report.student.first_name
end



