# == Schema Information
#
# Table name: check_ins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  bound_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe CheckIn, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
