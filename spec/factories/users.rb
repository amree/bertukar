# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email)    { |n| "#{Faker::Internet.email} #{n}" }
    sequence(:password) { |n| "#{Faker::Name.name} #{n}" }
  end
end
