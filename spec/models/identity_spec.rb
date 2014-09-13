require 'rails_helper'

RSpec.describe Identity, :type => :model do
  let(:identity) { FactoryGirl.create(:identity) }
  subject { identity }

  describe 'associations' do
    it { is_expected.to respond_to(:user) }
  end

  describe 'validations' do
    before { identity }

    it 'that combination of provider and user_id is not uniqueness' do
      another_identity = FactoryGirl.build(:identity, uid: identity.uid.reverse)
      expect(another_identity).to be_invalid
    end

    it 'that combination of provider and uid is not uniqueness' do
      another_identity = FactoryGirl.build(:identity, user_id: 2, uid: identity.uid)
      expect(another_identity).to be_invalid
    end
  end
end
