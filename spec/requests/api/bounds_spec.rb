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
        expect(json).to_not have_errors
      end
    end

    it_behaves_like 'w/o Authorization header'
  end

  describe 'POST /api/bounds/:id/check_in' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      context 'w/ valid beacon id' do
        let(:id) { bounds[0].id }
        it 'returns 201 created', :autodoc do
          is_expected.to eq 201
          expect(response.body).to_not have_errors
          expect(@user.check_ins.where(bound: bounds[0])).to be_present
        end
      end

      context 'w/ invalid beacon id' do
        let(:id) { not_existed_id(Bound) }
        it 'returns 404 not found' do
          is_expected.to eq 404
          expect(response.body).to have_error_message('That bound does not exist.')
        end
      end
    end

    it_behaves_like 'w/o Authorization header' do
      let(:id) { bounds[0].id }
    end
  end
end
