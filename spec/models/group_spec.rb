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
    it { is_expected.to have_many(:exhibitions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
