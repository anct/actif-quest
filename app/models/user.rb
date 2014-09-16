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
#  index_users_on_name  (name) UNIQUE
#

class User < ActiveRecord::Base
  has_many :identities
  has_many :votes
  has_many :voted_exhibitions, class_name: Exhibition.name, through: :votes
  has_many :statuses, dependent: :destroy
  
  validates_presence_of :name, :screen_name
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w)+\Z/
  validates_length_of :name, within: 5..16

  def vote(votable)
    raise ArgumentError unless votable.respond_to? :votes
    self.votes.create votable: votable
  end

  def unvote(votable)
    raise ArgumentError unless votable.respond_to? :votes
    self.votes.find_by(votable: votable).try(:destroy)
  end
end
