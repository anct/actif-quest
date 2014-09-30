# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spam_report do
    reporter_id 1
    spam_id 1
    spam_type "MyString"
  end
end
