FactoryGirl.define do
  factory :health_report do
    student
    group
    day { Faker::Date.today }
    special_care [true, false].sample
    health_note { Faker::Lorem.sentence }
  end
end
