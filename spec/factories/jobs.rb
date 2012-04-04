# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    association     :user
    association     :location
    association     :title
    association     :ministry
    gred            "41"
    is_exchange     false
    sequence(:nama_organisasi)  { Faker::Name.name }
    sequence(:expired_at)       { Time.now + 6.months }
  end
end
