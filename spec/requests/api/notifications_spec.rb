require 'rails_helper'

RSpec.describe 'Notifications API', type: :request do

  let!(:notifications) { FactoryGirl.create_list(:notification, 5) }

  describe 'GET /api/notifications' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it 'returns the notifications', :autodoc do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
      end
    end
  end
end
