require 'rails_helper'

RSpec.describe 'Statuses API', type: :request do

  let!(:statuses) { FactoryGirl.create_list(:status, 5) }

  describe 'GET /api/statuses' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it 'returns the statuses', :autodoc do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
      end
    end
  end
end
