FactoryGirl.define do
  factory :health_report do
    day { Faker::Date.backward(100) }
    health_note { Faker::Lorem.sentence }
    special_care [true, false].sample
  end
end
