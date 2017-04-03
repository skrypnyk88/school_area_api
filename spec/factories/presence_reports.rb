FactoryGirl.define do
  factory :presence_report do
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
    day DateTime.now
    group
    student
=======
    day { Faker::Date.forward(30) }
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
