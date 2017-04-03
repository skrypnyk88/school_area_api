json.extract! @bottle_report, :id, :day
json.bottles @bottles, :id, :quantity, :time, :uom, :bottle_report_id
