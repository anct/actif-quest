require 'rails_helper'

RSpec.describe 'Bounds API', type: :request do

  let(:user) { FactoryGirl.create(:user) }
  let!(:bounds) { FactoryGirl.create_list(:bound, 5) }

  describe 'GET /api/bounds' do
    context 'w/ Authozization header' do
      before do
        headers['Authorization'] = "Token token=#{user.authentication_token}"
        params['uid'] = user.uid
      end

      it do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
      end
    end
  end
end
