# == Schema Information
#
# Table name: exhibitions
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  introduction :string(255)
#  image_url    :string(255)
#  group_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Exhibition, :type => :model do
  let(:exhibition) { FactoryGirl.create(:exhibition) }
  subject { exhibition }

  describe 'associations' do
    it { is_expected.to respond_to(:group) }
  end

  describe 'validations' do
    it { is_expected.to be_valid }

    context 'w/o name' do
      before { exhibition.name = nil }
      it { is_expected.to be_invalid }
    end

    context 'w/o introduction' do
      before { exhibition.introduction = nil }
      it { is_expected.to be_invalid }
    end

    context 'w/o group' do
      before { exhibition.group_id = nil }
      it { is_expected.to be_invalid }
    end
  end
end
