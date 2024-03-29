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
#  remember_token         :string(255)
#  uid                    :string(255)
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_remember_token        (remember_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid                   (uid) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  include SpamReportable
  include TokenAuthenticatable

  has_many :check_ins
  has_many :identities, dependent: :delete_all
  has_many :votes
  has_many :voted_exhibitions, through: :votes, source: :votable, source_type: Exhibition.name
  has_many :favorites
  has_many :favorite_statuses, through: :favorites, source: :favorable, source_type: Status.name
  has_many :statuses, dependent: :destroy
  has_many :taken_treasures
  has_many :treasures, through: :taken_treasures
  has_many :spam_reports, foreign_key: :reporter_id
  has_many :spam_users, through: :spam_reports, source: :spam, source_type: User.name
  has_many :spam_statuses, through: :spam_reports, source: :spam, source_type: Status.name

  validates_presence_of :name, :screen_name
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w)+\Z/
  validates_length_of :name, within: 5..16

  before_create -> (user) do
    loop do
      uid = SecureRandom.uuid
      user.uid = uid and break if User.where(uid: uid).blank?
    end
  end

  try :before_restore, -> (model) { Identity.only_deleted.where(user_id: model.id).restore_all }

  def fav(favorable)
    raise ArgumentError unless favorable.respond_to? :favorites
    self.favorites.build(favorable: favorable).save
  end

  def unfav(favorable)
    raise ArgumentError unless favorable.respond_to? :favorites
    self.favorites.find_by(favorable: favorable).try(:destroy).present?
  end

  def post(body)
    raise ArgumentError if body.blank?
    self.statuses.create!(body: body)
  end

  def vote(votable)
    raise ArgumentError unless votable.respond_to? :votes
    self.votes.build(votable: votable).save
  end

  def unvote(votable)
    raise ArgumentError unless votable.respond_to? :votes
    self.votes.find_by(votable: votable).try(:destroy)
  end

  def check_in(bound)
    raise ArgumentError unless bound.is_a? Bound
    self.check_ins.find_or_create_by(bound: bound)
  end

  def spam_report(spam)
    raise ArgumentError unless spam.respond_to? :spam_reports
    self.spam_reports.find_or_create_by(spam: spam)
  end

  def take(treasure)
    raise ArgumentError unless treasure.is_a? Treasure
    self.taken_treasures.build(treasure: treasure).save
  end
  
  def has_provider?(provider)
    self.identities.any? { |i| i.provider == provider.to_s }
  end

  def add_identity(auth)
    self.identities << Identity.create_from_omniauth(auth)
  end

  def self.find_by_auth_params(auth)
    Identity.find_by(provider: auth.provider, uid: auth.uid).try(:user)
  end

  def self.create_from_omniauth(auth)
    transaction do
      User.create!(
        name: auth.info.nickname.presence || auth.info.name.gsub(/\s/, '_'),
        screen_name: auth.info.name,
        image_url: auth.info.image
      ).tap { |user| user.add_identity(auth) }
    end
  end

  mount_uploader :image_url, UserUploader
end
