require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  let!(:users) { FactoryGirl.create_list(:user, 5) }

  describe '#show' do
    let(:user) { users[0] }
    before { get api_user_path(user) }
    it { expect(response).to be_success }
    it { expect(response.status).to eq 200 }

    describe 'response body' do
      subject { response.body }
      it { is_expected.to have_json_type(Hash) }
      it { is_expected.to be_json_eql(user.id).at_path('id') }
      it { is_expected.to be_json_eql("\"#{user.name}\"").at_path('name') }
      it { is_expected.to be_json_eql("\"#{user.screen_name}\"").at_path('screenName') }
      it { is_expected.to have_json_path('image') }
    end
  end

end
