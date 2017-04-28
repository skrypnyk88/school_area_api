require 'faker'

n = 0
2.times do |i|
  teacher = Teacher.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "teacher#{i + 1}@test.com",
    password: 'password',
    password_confirmation: 'password',
    gender: %w(male female other).sample,
    phone: '1234567890',
    locale: %w(en ua).sample
  )

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
end
