# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  screen_name            :string(255)
#  image_url              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  deleted_at             :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#  remember_token         :string(255)
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_remember_token        (remember_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  it_behaves_like 'token authenticatable' do
    let(:token_authenticatable) { user }
  end

  describe 'associations' do
    it { is_expected.to have_many(:identities) }
    it { is_expected.to have_many(:votes) }
    it { is_expected.to have_many(:voted_exhibitions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to ensure_length_of(:name).is_at_most(16) }
    it { is_expected.to ensure_length_of(:name).is_at_least(5) }
    it { is_expected.to allow_value('izumin5210').for(:name) }
    it { is_expected.not_to allow_value('ほげほげ').for(:name) }
    it { is_expected.not_to allow_value('foo bar').for(:name) }

    it { is_expected.to validate_presence_of(:screen_name) }
  end

  describe '#vote' do
    create_temp_table(:votable_objects) { |t| true }
    VotableObject = Class.new(ActiveRecord::Base) { include Votable }

    context 'w/ votable object as argument' do
      let(:votable) { VotableObject.new }
      context 'not yet voted' do
        it { expect { user.vote(votable) }.to change(Vote, :count).by(1) }
      end

      context 'already voted' do
        before { user.votes.create!(votable: votable); }
        it { expect { user.vote(votable) }.to change(Vote, :count).by(0) }
      end
    end

    context 'w/ unvotable object as argument' do
      it { expect { user.vote(Object.new) }.to raise_error(ArgumentError) }
    end
  end

  describe '#unvote' do
    create_temp_table(:votable_objects) { |t| true }
    VotableObject = Class.new(ActiveRecord::Base) { include Votable }

    context 'w/ votable object as argument' do
      let(:votable) { VotableObject.new }
      context 'not yet voted' do
        it { expect { user.unvote(votable) }.to change(Vote, :count).by(0) }
      end

      context 'already voted' do
        before { user.votes.create!(votable: votable); }
        it { expect { user.unvote(votable) }.to change(Vote, :count).by(-1) }
      end
    end

    context 'w/ unvotable object as argument' do
      it { expect { user.unvote(Object.new) }.to raise_error(ArgumentError) }
    end
  end

  describe '#post' do
    context 'w/ valid argument' do
      it { expect { user.post('こころぴょんぴょん') }.to change(Status, :count).by(1) }
    end

    context 'w/ invalid argument' do
      it { expect { user.post(nil) }.to raise_error(ArgumentError) }
    end
  end

  describe '#fav' do
    create_temp_table(:favorable_objects) { |t| true }
    FavorableObject = Class.new(ActiveRecord::Base) { include Favorable }

    context 'w/ favorable object as argument' do
      let(:favorable) { FavorableObject.new }
      context 'not yet faved' do
        it { expect { user.fav(favorable) }.to change(Favorite, :count).by(1) }
      end

      context 'already faved' do
        before { user.favorites.create!(favorable: favorable); }
        it { expect { user.fav(favorable) }.to change(Favorite, :count).by(0) }
      end
    end

    context 'w/ unfavorable object as argument' do
      it { expect { user.fav(Object.new) }.to raise_error(ArgumentError) }
    end
  end

  describe '#unfav' do
    create_temp_table(:favorable_objects) { |t| true }
    FavorableObject = Class.new(ActiveRecord::Base) { include Favorable }

    context 'w/ favorable object as argument' do
      let(:favorable) { FavorableObject.new }
      context 'not yet faved' do
        it { expect { user.unfav(favorable) }.to change(Favorite, :count).by(0) }
      end

      context 'already faved' do
        before { user.favorites.create!(favorable: favorable); }
        it { expect { user.unfav(favorable) }.to change(Favorite, :count).by(-1) }
      end
    end

    context 'w/ unfavorable object as argument' do
      it { expect { user.unfav(Object.new) }.to raise_error(ArgumentError) }
    end
  end

  describe '#has_provider?' do
    before { user.identities << FactoryGirl.create(:identity, provider: 'twitter') }
    context 'w/ provider that already authenticated' do
      it { expect(user.has_provider?(:twitter)).to be_truthy }
    end
    context 'w/ provider that not yet authenticated' do
      it { expect(user.has_provider?(:facebook)).to be_falsy }
    end
  end

  describe '#add_identity' do
    context 'w/ valid argument' do
      it { expect { user.add_identity(auth_params) }.to change(user.identities, :count).by(1) }
    end
  end

  describe '.find_by_auth_params' do
    context 'when user is exists' do
      before { user.identities << FactoryGirl.create(:identity, provider: :twitter, uid: '123456') }
      it { expect(User.find_by_auth_params(auth_params)).to eq user }
    end

    context 'when user is not exists' do
      before { user.identities << FactoryGirl.create(:identity, provider: :facebook, uid: '123456') }
      it { expect(User.find_by_auth_params(auth_params)).to be_nil }
    end
  end

  describe '.create_from_omniauth' do
    context 'w/ valid argument' do
      it { expect { User.create_from_omniauth(auth_params) }.to change(User, :count).by(1) }
      it { expect { User.create_from_omniauth(auth_params) }.to change(Identity, :count).by(1) }
    end
  end
end
