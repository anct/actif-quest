require 'rails_helper'

RSpec.describe 'Beacons API', type: :request do

  let!(:beacons) { FactoryGirl.create_list(:beacon, 5) }

  describe 'GET /api/beacons' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it 'returns the beacons', :autodoc do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
        expect(json).to_not have_errors
      end
    end

    it_behaves_like 'w/o Authorization header'
  end
end
