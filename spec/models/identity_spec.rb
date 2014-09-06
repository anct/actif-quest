require 'rails_helper'

RSpec.describe Identity, :type => :model do

  describe 'validations' do

    before { FactoryGirl.create(:identity) }

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
