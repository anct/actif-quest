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
    it { is_expected.to belong_to(:group) }
    it_behaves_like 'votable' do
      let(:votable) { FactoryGirl.create(:exhibition) }
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:introduction) }
    it { is_expected.to validate_presence_of(:group_id) }
  end
end
