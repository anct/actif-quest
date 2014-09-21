# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  favorable_id   :integer
#  favorable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Favorite < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :favorable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:favorable_id, :favorable_type] }
end
