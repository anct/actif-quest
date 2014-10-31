require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  let!(:users) { FactoryGirl.create_list(:user, 5) }

  describe 'GET /api/users/:id' do
    let(:user) { users[0] }
    let(:id) { users[0].id }
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it 'returns the user', :autodoc do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Hash)
        expect(json).to be_json_eql(user.id).at_path('id')
        expect(json).to be_json_eql(%("#{user.uid}")).at_path('uid')
        expect(json).to be_json_eql(%("#{user.name}")).at_path('name')
        expect(json).to be_json_eql(%("#{user.screen_name}")).at_path('screenName')
        expect(json).to be_json_eql(%("#{user.authentication_token}")).at_path('authenticationToken')
        expect(json).to have_json_path('image')
        expect(json).to have_json_path('image/mdpi')
        expect(json).to have_json_path('image/hdpi')
        expect(json).to have_json_path('image/xhdpi')
        expect(json).to have_json_path('image/xxhdpi')
        expect(json).to_not have_errors
      end
    end

    it_behaves_like 'w/o Authorization header'
  end

  describe 'POST /api/users' do
    context 'w/ valid params' do
      let(:params) { { user: { name: 'izumin5210' } } }
      it 'returns the created user', :autodoc do
        is_expected.to eq 201
        json = response.body
        expect(json).to_not have_errors
      end
    end

    context 'w/ invalid params' do
      let(:params) { { user: { name: 'こころぴょんぴょん' } } }
      it 'returns 400 bad request' do
        is_expected.to eq 400
        expect(response.body).to have_error_message('That name is invalid format.')
      end
    end

    context 'when that name has already used' do
      let(:params) { { user: { name: users[0].name } } }
      it 'returns 409 conflict' do
        is_expected.to eq 409
        expect(response.body).to have_error_message('That user name has already existed.')
      end
    end
  end
end
