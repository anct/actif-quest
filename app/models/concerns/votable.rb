module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable, dependent: :destroy
    has_many :voted_users, through: :votes, class_name: User.name
  end
end
