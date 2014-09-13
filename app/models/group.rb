class Group < ActiveRecord::Base
  has_many :exhibitions
  validates :name, presence: true, length: { maximam: 30 }
end
