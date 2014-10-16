require 'rails_helper'

RSpec.describe 'Beacons API', type: :request do

  let!(:beacons) { FactoryGirl.create_list(:beacon, 5) }

  describe 'GET /api/beacons' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
      end
    end
  end
end
