json.array!(@bottle_reports) do |bottle_report|
  json.extract! bottle_report, :id, :day, :group_id
  json.student do
    json.partial! 'v1/students/student', locals: { student: bottle_report.student }
  end
  json.bottles bottle_report.bottles.order(id: :asc) do |bottle|
    json.id bottle.id
    json.quantity bottle.quantity
    json.time bottle.time_formated
    json.uom bottle.uom
    json.bottle_report_id bottle.bottle_report_id
  end
end
