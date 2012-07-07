# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ministry do
    sequence(:nama) { |n| "#{Faker::Name.name} #{n}" }
  end
end
