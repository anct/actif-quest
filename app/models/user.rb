class User < ActiveRecord::Base
  validates_presence_of :name, :screen_name
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w)+\Z/
  validates_length_of :name, within: 5..16
end
