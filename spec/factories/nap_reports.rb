FactoryGirl.define do
  factory :nap_report do
    day DateTime.now
    group
    student
  end
end
