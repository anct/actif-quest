# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  screen_name :string(255)
#  image_url   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  deleted_at  :datetime
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

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

    context 'w/ valid argument' do
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
end
