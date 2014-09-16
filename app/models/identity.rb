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

class Identity < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :uid, :provider, :token
  validates_uniqueness_of :provider, scope: :uid
  validates_uniqueness_of :provider, scope: :user_id
end
