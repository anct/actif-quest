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
