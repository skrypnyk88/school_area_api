FactoryGirl.define do
  factory :report_time do
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
    start_time { Faker::Time.between(Time.now, Time.now, :morning) }
    end_time { Faker::Time.between(Time.now, Time.now, :morning) }
=======
    start_time { Faker::Date.forward(30) }
    end_time { Faker::Date.forward(30) }
>>>>>>> LVRUBYM-219: add ReportTimesController
    association :reportable
=======
    
>>>>>>> LVRUBYM-203: ReportTime model creation
  end
end
