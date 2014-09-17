# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Notification, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
