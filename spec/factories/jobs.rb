# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    user ""
    location ""
    jenis "MyString"
    skim "MyString"
    gred 1
    nota "MyText"
    nama_organisasi "MyString"
    expired_at "2012-01-28 09:08:30"
    closed_at "2012-01-28 09:08:30"
  end
end
