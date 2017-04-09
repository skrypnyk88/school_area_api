FactoryGirl.define do
  factory :bottle do
    bottle_report
    quantity { Faker::Number.between(30, 300) }
    time DateTime.now
    uom { %w(ml oz).sample }
  end
end
