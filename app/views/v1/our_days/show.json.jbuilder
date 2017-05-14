json.students do
    json.partial! 'v1/students/student',
    collection: @group.students, as: :student
end
if @our_day
  json.our_day(@our_day, :id,
                         :description,
                         :day)
else
  json.our_day nil
end
