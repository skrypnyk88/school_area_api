FactoryGirl.define do
  factory :presence_report do
    day { Faker::Date.forward(30) }  
  end
end
