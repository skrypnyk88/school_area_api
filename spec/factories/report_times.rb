FactoryGirl.define do
  factory :report_time do
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
    start_time { Faker::Time.between(Time.now, Time.now, :morning) }
    end_time { Faker::Time.between(Time.now, Time.now, :morning) }
    association :reportable
=======
    start_time { Faker::Date.forward(30) }
    end_time { Faker::Date.forward(30) }
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
