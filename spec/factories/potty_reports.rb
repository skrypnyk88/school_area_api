FactoryGirl.define do
  factory :potty_report do
    day { Faker::Date.between(2.days.ago, Date.today) }
  end
end
