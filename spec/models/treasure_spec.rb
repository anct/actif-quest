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

RSpec.describe Treasure, type: :model do

  let(:treasure) { FactoryGirl.create(:treasure) }
  subject { treasure }

  describe 'associations' do
    it { is_expected.to belong_to(:bound) }
    it { is_expected.to have_many(:taken_treasures) }
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
