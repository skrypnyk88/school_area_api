FactoryGirl.define do
  factory :presence_report do
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
    day DateTime.now
=======
    day { Faker::Date.forward(30) }
>>>>>>> LVRUBYM-219: add ReportTimesController
    group
    student
=======
    
>>>>>>> LVRUBYM-203: ReportTime model creation
  end
end
