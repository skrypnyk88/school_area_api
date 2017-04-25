require 'faker'

<<<<<<< 68884a04755223fe567efd3a1454c892e5bd5307
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
=======
>>>>>>> LVRUBYM-221:Fixed seeds and schema
n = 0
2.times do |i|
<<<<<<< 6b426f725b27b5ae5adb7f602876ca02cc82fe0d
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
  teacher = Teacher.create(
=======
=======

>>>>>>> LVRUBYM-190: User actions on backend
Teacher.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  gender: %w(male female other).sample,
  phone: '1234567890'
)

<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
group = Group.create(name: 'Group 1')

15.times do
  student = group.students.create(
>>>>>>> LVRUBYM-190: User actions on backend
=======
10.times do
  student = group.students.create(
>>>>>>> LVRUBYM-190: User actions on backend
=======
  teacher = Teacher.create(
>>>>>>> LVRUBYM-219: add ReportTimesController
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "teacher#{i + 1}@test.com",
    password: 'password',
    password_confirmation: 'password',
    gender: %w(male female other).sample,
    phone: '1234567890'
  )

<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
  3.times do
    group = Group.create(name: "Group #{n += 1}")
    teacher.groups << group

    10.times do
      student = group.students.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        birthdate: Faker::Date.birthday(2, 6),
        gender: Faker::Demographic.sex.downcase
      )

      group.my_day_reports.create(
        day: Faker::Date.backward(111),
        note:  Faker::Lorem.sentence,
        student_id: student.id
      )

      presence_report = group.presence_reports.create(
        day: Faker::Date.backward(111),
        student_id: student.id
      )

      presence_report.report_times.create(
        start_time: Faker::Date.backward(111),
        end_time: Faker::Date.backward(111)
      )

      group.my_day_reports.create(
        day: Faker::Date.backward(111),
        note: Faker::Lorem.sentence,
        student_id: student.id
      )

      bottle_report = group.bottle_reports.create(
      group_id: group.id,
      student_id: student.id,
      day: Faker::Date.forward(23)
      )

      bottle_report.bottles.create(
      bottle_report_id: bottle_report.id,
      quantity: Faker::Number.between(30, 300),
      time: DateTime.now,
      uom: %w(ml oz).sample
      )
    end
  end
=======
  group.my_day_reports.create(
    day: Faker::Date.backward(111),
    note:  Faker::Lorem.sentence,
    student_id: student.id
  )

  presence_report = group.presence_reports.create(
    day: Faker::Date.backward(111),
    student_id: student.id
  )

  presence_report.report_times.create(
    start_time: Faker::Date.backward(111),
    end_time: Faker::Date.backward(111)
  )
>>>>>>> LVRUBYM-219: add ReportTimesController
end
