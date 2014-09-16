# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  uid        :string(255)
#  provider   :string(255)
#  token      :string(255)
#  expires_at :datetime
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_identities_on_uid                   (uid)
#  index_identities_on_uid_and_provider      (uid,provider) UNIQUE
#  index_identities_on_user_id_and_provider  (user_id,provider) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    uid { Faker::Number.number(8) }
    provider "facebook"
    token { Faker::Internet.password }
    expires_at "2014-09-07 05:07:04"
  end
end
