FactoryGirl.define do
  factory :teacher do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name}.#{last_name}@gmail.com".downcase }
    password 'password'
    password_confirmation 'password'
    gender { %w(male female other).sample }
    phone '0673355891'
    locale { %w(en ua).sample }
  end
end
