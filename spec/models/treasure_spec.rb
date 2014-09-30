# == Schema Information
#
# Table name: treasures
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image_url   :string(255)
#  bound_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Treasure, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
