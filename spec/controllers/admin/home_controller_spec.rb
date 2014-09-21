require 'rails_helper'

RSpec.describe Admin::HomeController, :type => :controller do
  describe 'GET #dashboard' do
    before { sign_in_as_admin }
    subject { get 'dashboard' }
    it { is_expected.to be_success }
  end
end
