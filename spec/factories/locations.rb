# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    sequence(:nama) { Faker::Name.name }
  end

  factory :location_with_state, parent: :location do
    after_create { |location|
      location.districts.build
      location.districts[0] = Factory(:location, state: location)
    }
  end
end
