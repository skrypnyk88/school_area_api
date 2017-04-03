<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
json.array!(@reports) do |report|
  json.extract! report, :id, :day, :group_id
  json.student report.student, :id, :first_name, :last_name
  json.report_time report.report_times.order(id: :asc) do |report_time|
    json.id report_time.id
    json.start_time report_time.start_time_formated
    json.end_time report_time.end_time_formated
=======
json.presence_reports @presence_reports do |presence_report|
  json.id presence_report.id
  json.report_times presence_report.report_times do |report_time|
    json.id report_time.id
    json.start_time report_time.start_time
    json.end_time report_time.end_time     
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
