FactoryGirl.define do
  factory :health_report do
    day { Faker::Date.backward(100) }
    special_care [true, false].sample
    health_note { Faker::Lorem.sentence }
  end
end
