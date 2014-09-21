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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  has_many :identities
  has_many :votes
  has_many :voted_exhibitions, class_name: Exhibition.name, through: :votes
  has_many :favorites
  has_many :favorite_statuses, class_name: Status.name, through: :favorites
  has_many :statuses, dependent: :destroy
  
  validates_presence_of :name, :screen_name
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w)+\Z/
  validates_length_of :name, within: 5..16

  def fav(favorable)
    raise ArgumentError unless favorable.respond_to? :favorites
    self.favorites.create(favorable: favorable)
  end

  def unfav(favorable)
    raise ArgumentError unless favorable.respond_to? :favorites
    self.favorites.find_by(favorable: favorable).try(:destroy)
  end

  def post(body)
    raise ArgumentError if body.blank?
    self.statuses.create(body: body)
  end

  def vote(votable)
    raise ArgumentError unless votable.respond_to? :votes
    self.votes.create votable: votable
  end

  def unvote(votable)
    raise ArgumentError unless votable.respond_to? :votes
    self.votes.find_by(votable: votable).try(:destroy)
  end
end
