FactoryGirl.define do
  factory :report_time do
<<<<<<< b65e4a29b844cb164727aae68d6b9ad169158d53
    start_time { Faker::Time.between(Time.now, Time.now, :morning) }
    end_time { Faker::Time.between(Time.now, Time.now, :morning) }
    association :reportable
=======
    
>>>>>>> LVRUBYM-203: ReportTime model creation
  end
end
