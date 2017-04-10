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
  group.students.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(2, 6),
    gender: Faker::Demographic.sex.downcase
  )
  OurDay.create(
    description: Faker::Lorem.paragraph,
    day: Faker::Date.between(10.days.ago, Date.today),
    group_id: 1
  )
  group.my_day_reports.create(
    day: Faker::Date.backward(111),
    note:  Faker::Lorem.sentence,
    student_id: student.id

  )
end
