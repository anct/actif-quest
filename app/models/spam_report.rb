# == Schema Information
#
# Table name: spam_reports
#
#  id          :integer          not null, primary key
#  reporter_id :integer
#  spam_id     :integer
#  spam_type   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class SpamReport < ActiveRecord::Base

  belongs_to :reporter, class_name: User.name
  belongs_to :spam, polymorphic: true

  validates_presence_of :reporter_id, :spam_id, :spam_type
  validates_uniqueness_of :reporter_id, scope: [:spam_id, :spam_type]
end
