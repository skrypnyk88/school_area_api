json.array!(@nap_reports) do |nap_report|
  json.extract! nap_report, :id, :day, :group_id
  json.student do
    json.partial! 'v1/students/student', locals: { student: nap_report.student }
  end
  json.report_time nap_report.report_times.order(id: :asc) do |report_time|
    json.id report_time.id
    json.start_time report_time.start_time_formated
    json.end_time report_time.end_time_formated
  end
end
