# == Schema Information
#
# Table name: taken_treasures
#
#  id          :integer          not null, primary key
#  user_id     :string(255)
#  treasure_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe TakenTreasure, :type => :model do

  subject { TakenTreasure.new }

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :treasure }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:treasure_id) }
  end
end
