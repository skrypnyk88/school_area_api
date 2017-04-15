require 'faker'
<<<<<<< efb05c16b8afe9fe38f2a2099e0b8a679780a9cb
n = 0
2.times do |i|
  teacher = Teacher.create(
=======

Teacher.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  gender: %w(male female other).sample,
  phone: '1234567890'
)

group = Group.create(name: 'Group 1')

15.times do
  student = group.students.create(
>>>>>>> LVRUBYM-190: User actions on backend
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "teacher#{i + 1}@test.com",
    password: 'password',
    password_confirmation: 'password',
    gender: %w(male female other).sample,
    phone: '1234567890'
  )

<<<<<<< 5c0bc7762ed72a707b07d65e609572a0ef480472
  3.times do
    group = Group.create(name: "Group #{n += 1}")
    teacher.groups << group

    10.times do
      student = group.students.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        birthdate: Faker::Date.between(6.years.ago, 2.years.ago),
        gender: Faker::Demographic.sex.downcase
      )

      group.my_day_reports.create(
        day: Faker::Date.backward(111),
        note:  Faker::Lorem.sentence,
        student_id: student.id
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
