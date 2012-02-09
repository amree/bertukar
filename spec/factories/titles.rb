# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :title do
    sequence(:nama) { Faker::Name.name }
    sequence(:skim) { [*('A'..'Z')].sample(2).join }
  end
end
