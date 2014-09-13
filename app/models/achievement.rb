class Achievement < ActiveRecord::Base
  validates :name, presence: true
  validates :condition, presence: true
  validates :description, presence: true
end
