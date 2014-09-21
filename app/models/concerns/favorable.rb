module Favorable
  extend ActiveSupport::Concern

  included do
  	has_many :favorites, as: :favorable, dependent: :destroy
  	has_many :favored_users, through: :favorites, class_name: User.name
  end
end
