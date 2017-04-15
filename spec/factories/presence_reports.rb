FactoryGirl.define do
  factory :presence_report do
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
    day DateTime.now
=======
    day { Faker::Date.forward(30) }
>>>>>>> LVRUBYM-219: add ReportTimesController
    group
    student
  end
end
