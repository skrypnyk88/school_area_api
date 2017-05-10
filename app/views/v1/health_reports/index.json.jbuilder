json.array!(@reports) do |report|
  json.report report, :id, :special_care, :health_note, :day
  json.student report.student, :id, :first_name, :last_name
end
