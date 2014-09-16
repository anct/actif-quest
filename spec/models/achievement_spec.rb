# == Schema Information
#
# Table name: achievements
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  condition   :string(255)
#  description :string(255)
#  icon_url    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Achievement, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
