# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Group, :type => :model do
  let(:group) { FactoryGirl.create(:group) }
  subject { group }

  describe 'associations' do
    it { is_expected.to respond_to(:exhibitions) }
  end

  describe 'validations' do
    it { is_expected.to be_valid }

    context 'w/o name' do
      before { group.name = nil }
      it { is_expected.to be_invalid }
    end
  end
end
