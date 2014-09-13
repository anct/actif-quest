class Group < ActiveRecord::Base
  has_many :exhibitions
  validates :name, presence: true, length: { maximum: 30 }
end
