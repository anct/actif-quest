require 'rails_helper'

RSpec.describe Vote, :type => :model do
  subject { Vote.new }

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :votable }
  end
end
