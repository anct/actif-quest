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
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {
      Faker::Config.locale = :en
      Faker::Internet.user_name(5..16).gsub(/\./, '')
    }
    screen_name {
      Faker::Config.locale = :ja
      Faker::Name.name
    }
    image_url {
      Faker::Config.locale = :en
      Faker::Internet.url
    }
  end
end
