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
end
