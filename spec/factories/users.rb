FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@gmail.com"
    end
    name     'Jason'
    password 'password'
  end
end
