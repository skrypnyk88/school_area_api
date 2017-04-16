json.array! @reports do |report|
  json.first_name report.student.first_name
  json.last_name report.student.last_name
  json.health_id report.id
  json.special_care report.special_care
  json.health_note report.health_note
  json.day report.day
end.sort_by! { |hash| hash['health_id'].to_i}
