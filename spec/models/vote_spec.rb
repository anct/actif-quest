# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  votable_id   :integer
#  votable_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Vote, :type => :model do
  subject { Vote.new }

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :votable }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to([:votable_id, :votable_type]) }
  end
end
