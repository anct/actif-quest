class Identity < ActiveRecord::Base

  validates_presence_of :uid, :provider, :token
  validates_uniqueness_of :provider, scope: :uid
  validates_uniqueness_of :provider, scope: :user_id
end
