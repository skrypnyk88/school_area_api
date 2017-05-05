FactoryGirl.define do
  factory :attachment do
    file { fixture_file_upload "#{::Rails.root}/spec/fixtures/files/test.png" }
    association :attachable, factory: :user
  end
end
