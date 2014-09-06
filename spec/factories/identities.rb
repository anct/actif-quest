# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    user_id 1
    uid "12345"
    provider "facebook"
    token "usertoken"
    expires_at "2014-09-07 05:07:04"
  end
end
