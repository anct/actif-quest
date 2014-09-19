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

require 'rails_helper'

RSpec.describe Favorite, :type => :model do
  subject { Favorite.new }

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :votable }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to([:favorable_id, :favorable_type]) }
  end
end
