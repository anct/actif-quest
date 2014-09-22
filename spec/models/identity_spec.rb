# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  uid        :string(255)
#  provider   :string(255)
#  token      :string(255)
#  expires_at :datetime
#  created_at :datetime
#  updated_at :datetime
#  secret     :string(255)
#
# Indexes
#
#  index_identities_on_uid                   (uid)
#  index_identities_on_uid_and_provider      (uid,provider) UNIQUE
#  index_identities_on_user_id_and_provider  (user_id,provider) UNIQUE
#

require 'rails_helper'

RSpec.describe Identity, :type => :model do
  let(:identity) { FactoryGirl.create(:identity) }
  subject { identity }

  let(:user) { FactoryGirl.create(:user) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it 'that combination of provider and user_id is not uniqueness' do
      another_identity = FactoryGirl.build(:identity, uid: identity.uid.reverse)
      expect(another_identity).to be_invalid
    end

    it 'that combination of provider and uid is not uniqueness' do
      another_identity = FactoryGirl.build(:identity, user_id: 2, uid: identity.uid)
      expect(another_identity).to be_invalid
    end
  end

  describe '.create_from_omniauth' do
    context 'w/ complete argument' do
      it { expect { Identity.create_from_omniauth(auth_params) }.to change(Identity, :count).by(1) }
    end

    context 'w/ valid argument' do
      context 'w/o expires_at' do
        it do
          expect {
            auth = auth_params.tap { |h| h.delete(:expires_at) }
            Identity.create_from_omniauth(auth)
          }.to change(Identity, :count).by(1)
        end
      end

      context 'w/o secret' do
        it do
          expect {
            auth = auth_params.tap { |h| h.delete(:secret) }
            Identity.create_from_omniauth(auth_params)
          }.to change(Identity, :count).by(1)
        end
      end
    end
  end
end
