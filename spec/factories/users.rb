# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email)    { Faker::Internet.email }
    sequence(:password) { Faker::Name.name }
  end
end
