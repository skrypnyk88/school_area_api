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

FactoryGirl.define do
  factory :bottle_report do
    day { Faker::Date.forward(23) }
  end

  factory :bottle do
    bottle_report
    quantity { Faker::Number.between(30,300) }
    time '15:03'
    uom { %w(ml oz).sample }

  end
end

10.times { FactoryGirl.create(:bottle_report) }
10.times { FactoryGirl.create(:bottle) }
