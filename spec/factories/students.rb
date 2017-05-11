FactoryGirl.define do
  factory :student do
    first_name { Faker::Name.first_name.titleize }
    last_name { Faker::Name.last_name.titleize }
    birthdate { Faker::Date.birthday(2, 6) }
    gender { Faker::Demographic.sex.downcase }
    group
    attachment
  end
end
