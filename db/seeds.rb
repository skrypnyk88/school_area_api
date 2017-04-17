require 'faker'

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
end

10.times do
  group.health_reports.create(
    day: Faker::Date.backward(100),
    special_care: [true, false].sample,
    health_note: Faker::Lorem.sentence,
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
