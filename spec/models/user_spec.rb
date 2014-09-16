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
    it { is_expected.to respond_to(:identities) }
    it { is_expected.to have_many(:votes) }
    it { is_expected.to have_many(:voted_exhibitions) }
  end

  describe 'validations' do
    it { is_expected.to be_valid }

    context 'w/ name including alphabet and numbers' do
      before { user.name = 'izumin5210' }
      it { is_expected.to be_valid }
    end

    context 'w/o name' do
      before { user.name = nil }
      it { is_expected.to be_invalid }
    end

    context 'w/ invalid name' do
      context 'including space' do
        before { user.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
        it { is_expected.to be_invalid }
      end

      context 'including unusable character' do
        before { user.name = 'ほげほげ' }
        it { is_expected.to be_invalid }
      end

      context 'that is too short' do
        before { user.name = 'a' * 4 }
        it { is_expected.to be_invalid }
      end

      context 'that is too long' do
        before { user.name = 'a' * 17 }
        it { is_expected.to be_invalid }
      end

      context 'that is not uniqueness' do
        let(:other_user) { FactoryGirl.build(:user, name: user.name) }
        it { expect(other_user).to be_invalid }
      end
    end

    context 'w/o screen_name' do
      before { user.screen_name = nil }
      it { is_expected.to be_invalid }
    end
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
end
