# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    sequence(:nama) { |n| "#{Faker::Name.name} #{n}" }
  end

  factory :state_with_district, parent: :location do
    after_create { |location|
      location.districts.build
      location.districts[0] = Factory(:location, state: location)
    }
  end
end
