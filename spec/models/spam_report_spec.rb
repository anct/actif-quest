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

require 'rails_helper'

RSpec.describe SpamReport, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
