FactoryGirl.define do
  factory :bottle_report do
    day { Faker::Date.forward(23) }
  end
end
