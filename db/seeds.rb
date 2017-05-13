require 'faker'

julia = Teacher.create(
    first_name: "Julia",
    last_name: "Shtohtyn",
    email: "julia.ilkiv@gmail.com",
    password: 'password',
    password_confirmation: 'password',
    gender: 1,
    phone: '1234567890',
    locale: 0
  )

my_group = Group.create(name: "Sun")
  julia.groups << my_group

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

      presence_report = group.presence_reports.create(
        day: Date.today,
        student_id: student.id
      )

      presence_report.report_times.create(
        start_time: Date.today,
        end_time: Date.today
      )

      group.my_day_reports.create(
        day: Date.today,
        note: Faker::Lorem.sentence,
        student_id: student.id
      )

      bottle_report = group.bottle_reports.create(
        group_id: group.id,
        student_id: student.id,
        day: Date.today
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

