require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  let!(:users) { FactoryGirl.create_list(:user, 5) }

  describe 'GET /api/users/:id' do
    let(:user) { users[0] }
    let(:id) { users[0].id }
    context 'w/ Authozization header' do
      before do
        headers['Authorization'] = "Token token=#{user.authentication_token}"
        params['uid'] = user.uid
      end

      it do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Hash)
        expect(json).to be_json_eql(user.id).at_path('id')
        expect(json).to be_json_eql("\"#{user.name}\"").at_path('name')
        expect(json).to be_json_eql("\"#{user.screen_name}\"").at_path('screenName')
        expect(json).to have_json_path('image')
      end
    end
  end
end
