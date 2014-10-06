# == Schema Information
#
# Table name: bounds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Bound, type: :model do

  let(:bound) { FactoryGirl.create(:bound) }
  subject { bound }

  describe 'associations' do
    it { is_expected.to have_many(:beacons) }
    it { is_expected.to have_many(:check_ins) }
    it { is_expected.to have_many(:exhibitions) }
    it { is_expected.to have_many(:treasures) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
