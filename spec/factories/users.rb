# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  screen_name :string(255)
#  image_url   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  deleted_at  :datetime
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_remember_token        (remember_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "test_user#{n}" }
    sequence(:screen_name) { |n| "てすとゆーざ#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    authentication_token 'test_token'
    image_url {
      Faker::Config.locale = :en
      Faker::Internet.url
    }
  end
end
