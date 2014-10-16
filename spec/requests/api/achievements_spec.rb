require 'rails_helper'

RSpec.describe 'Achievements API', type: :request do

  let(:user) { FactoryGirl.create(:user) }
  let!(:achievements) { FactoryGirl.create_list(:achievement, 5) }

  describe 'GET /api/achievements' do
    context 'w/ Authorization header' do
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
