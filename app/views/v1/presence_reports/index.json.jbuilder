json.array!(@reports) do |report|
  json.extract! report, :id, :day, :group_id
  json.student report.student, :id, :first_name, :last_name
  json.report_time report.report_times.order(id: :asc) do |report_time|
    json.id report_time.id
    json.start_time report_time.start_time_formated
    json.end_time report_time.end_time_formated
  end
end
