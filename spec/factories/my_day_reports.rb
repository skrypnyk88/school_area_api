FactoryGirl.define do
  factory :my_day_report do
    day { Faker::Date.backward(111) }
    note { Faker::Lorem.sentence }
    group
    student
  end
end
