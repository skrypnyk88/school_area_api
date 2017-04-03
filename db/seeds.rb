<<<<<<< 7b75256756e3db6b3203b6c86b3d9394f9e06a6a
require 'faker'

<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
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
        birthdate: Faker::Date.birthday(2, 6),
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

