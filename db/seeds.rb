require 'faker'

10.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(2, 6),
    gender: Faker::Demographic.sex.downcase
  )
end
