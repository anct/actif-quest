# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  uuid       :string(255)
#  minor      :integer
#  major      :integer
#  latitude   :float
#  longitude  :float
#  floor      :integer
#  bound_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Beacon, type: :model do

  let(:beacon) { FactoryGirl.create(:beacon) }
  subject { beacon }

  describe 'associations' do
    it { is_expected.to belong_to(:bound) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:uuid) }
    it { is_expected.to validate_presence_of(:minor) }
    it { is_expected.to validate_presence_of(:major) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:floor) }
    it { is_expected.to validate_presence_of(:bound_id) }
  end
end
