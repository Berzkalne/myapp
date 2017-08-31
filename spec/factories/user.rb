FactoryGirl.define do
  factory :user do
    name 'Bob'
    email 'email@email.com'
    password 'password'
    password_confirmation 'password'
    age '18'
    description 'nerd'
  end
end
