require 'rails_helper'

RSpec.describe 'Achievements API', type: :request do

  let!(:achievements) { FactoryGirl.create_list(:achievement, 5) }

  describe 'GET /api/achievements' do
    context 'w/ Authorization header' do
      before { sign_in_as_user_with_token }

      it 'returns the achievements', :autodoc do
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
