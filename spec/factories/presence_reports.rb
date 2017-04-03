FactoryGirl.define do
  factory :presence_report do
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
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
=======
    day { Faker::Date.forward(30) }  
>>>>>>> LVRUBYM-192: Unit tests implementation
=======
    day { Faker::Date.forward(30) }
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
