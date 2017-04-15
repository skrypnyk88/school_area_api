FactoryGirl.define do
  factory :report_time do
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
    start_time { Faker::Time.between(Time.now, Time.now, :morning) }
    end_time { Faker::Time.between(Time.now, Time.now, :morning) }
=======
    start_time { Faker::Date.forward(30) }
    end_time { Faker::Date.forward(30) }
>>>>>>> LVRUBYM-219: add ReportTimesController
    association :reportable
  end
end
