json.array!(@bottle_reports) do |bottle_report|
  json.extract! bottle_report, :id, :day, :group_id, :student_id
  json.bottles bottle_report.bottles do |bottle|
    json.id bottle.id
    json.quantity bottle.quantity
    json.time bottle.time
    json.uom bottle.uom
    json.bottle_report_id bottle.bottle_report_id
  end
end