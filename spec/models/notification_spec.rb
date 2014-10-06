# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Notification, type: :model do

  let(:notification) { FactoryGirl.create(:notification) }
  subject { notification }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end
end
