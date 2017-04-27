FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name}.#{last_name}@gmail.com".downcase }
    password 'password'
    password_confirmation 'password'
    gender { %w(male female other).sample }
    phone '0673377891'
    locale { %w(en ua).sample }
    reset_password_token nil
  end
end
