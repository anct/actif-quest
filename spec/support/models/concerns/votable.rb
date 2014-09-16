require 'rails_helper'

shared_examples 'votable' do
  subject { votable }
  describe 'associations' do
    it { is_expected.to have_many :votes }
    it { is_expected.to have_many :voted_users }
  end
end
