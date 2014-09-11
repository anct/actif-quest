class Identity < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :uid, :provider, :token
  validates_uniqueness_of :provider, scope: :uid
  validates_uniqueness_of :provider, scope: :user_id
end
