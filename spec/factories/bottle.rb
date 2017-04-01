FactoryGirl.define do
  factory :bottle do
    bottle_report
    quantity { Faker::Number.between(30,300) }
    time '15:03'
    uom { %w(ml oz).sample }
  end
end
