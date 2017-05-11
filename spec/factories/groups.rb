FactoryGirl.define do
  factory :group do
    name 'Group name 11'

    factory :group_with_students do
      transient do
        students_count 3
      end

      after(:create) do |group, evaluator|
        create_list(:student, evaluator.students_count, group: group)
      end
    end
  end
end
