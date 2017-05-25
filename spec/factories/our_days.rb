require 'faker'

FactoryGirl.define do
  factory :our_day do
    description Faker::Lorem.paragraph
    day Date.today
    group
  end
end
