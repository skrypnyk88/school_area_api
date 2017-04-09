FactoryGirl.define do
  factory :bottle_report do
    group
    student
    day { Faker::Date.forward(23) }
  end
end
