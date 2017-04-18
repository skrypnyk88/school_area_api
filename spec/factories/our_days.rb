require 'faker'

FactoryGirl.define do
  factory :our_day do
    description Faker::Lorem.paragraph
    day Faker::Date.between(10.days.ago, Date.today)
    group
  end
end
