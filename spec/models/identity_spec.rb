require 'rails_helper'

RSpec.describe Identity, :type => :model do
  let(:identity) { FactoryGirl.create(:identity) }
  subject { identity }

  describe 'associations' do
    it { is_expected.to respond_to(:user) }
  end

  describe 'validations' do
    before { identity }

    it do
      another_identity = FactoryGirl.build(:identity, uid: '54321')
      expect(another_identity).to be_invalid
    end

    it do
      another_identity = FactoryGirl.build(:identity, user_id: 2)
      expect(another_identity).to be_invalid
    end
  end
end
