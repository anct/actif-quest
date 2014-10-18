require 'rails_helper'

RSpec.describe 'Bounds API', type: :request do

  let!(:bounds) { FactoryGirl.create_list(:bound, 5) }

  describe 'GET /api/bounds' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it 'returns the bounds', :autodoc do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
      end
    end
  end
end
