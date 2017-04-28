FactoryGirl.define do
  factory :report_time do
    start_time { Faker::Time.between(Time.now, Time.now, :morning) }
    end_time { Faker::Time.between(Time.now, Time.now, :morning) }
    association :reportable
  end
end
