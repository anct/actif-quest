# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

require 'rails_helper'

RSpec.describe Status, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
