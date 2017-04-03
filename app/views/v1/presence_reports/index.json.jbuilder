json.presence_reports @presence_reports do |presence_report|
  json.id presence_report.id
  json.report_times presence_report.report_times do |report_time|
    json.id report_time.id
    json.start_time report_time.start_time
    json.end_time report_time.end_time     
  end
end
