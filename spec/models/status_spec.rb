# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

require 'rails_helper'

RSpec.describe Status, :type => :model do
  let(:status) { FactoryGirl.create(:status) }
  subject { status }

  it_behaves_like 'favorable' do
    let(:favorable) { status }
  end

  it_behaves_like 'spam reportable' do
    let(:spam_reportable) { status }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it_behaves_like 'favorable' do
      let(:favorable) { status }
    end
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to ensure_length_of(:body).is_at_most(140) }
    it { is_expected.to ensure_length_of(:body).is_at_least(1) }
  end
end
