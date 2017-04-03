FactoryGirl.define do
  factory :report_time do
    start_time { Faker::Date.forward(30) }
    end_time { Faker::Date.forward(30) }
  end
end
