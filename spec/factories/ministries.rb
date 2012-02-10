# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ministry do
    sequence(:nama) { Faker::Name.name }
  end
end
