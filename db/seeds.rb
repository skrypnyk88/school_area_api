<<<<<<< 7b75256756e3db6b3203b6c86b3d9394f9e06a6a
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

=======
>>>>>>> LVRUBYM-190: User actions on backend
10.times do
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
end
