# == Schema Information
#
# Table name: spam_reports
#
#  id          :integer          not null, primary key
#  reporter_id :integer
#  spam_id     :integer
#  spam_type   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe SpamReport, type: :model do

  subject { SpamReport.new }

  describe 'associations' do
    it { is_expected.to belong_to(:reporter) }
    it { is_expected.to belong_to(:spam) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:reporter_id) }
    it { is_expected.to validate_presence_of(:spam_id) }
    it { is_expected.to validate_presence_of(:spam_type) }
    it { is_expected.to validate_uniqueness_of(:reporter_id).scoped_to([:spam_id, :spam_type]) }
  end
end
