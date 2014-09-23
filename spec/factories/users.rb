# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  screen_name            :string(255)
#  image_url              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  deleted_at             :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token)
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
