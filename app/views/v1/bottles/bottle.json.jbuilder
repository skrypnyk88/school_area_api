json.extract! @bottle, :id,
                       :quantity,
                       :uom,
                       :bottle_report_id
json.time @bottle.time.strftime('%H:%M')
