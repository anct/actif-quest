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

  describe 'POST /api/bounds/:id/check_in' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      context 'w/ valid beacon id' do
        let(:id) { bounds[0].id }
        it 'returns 201 created', :autodoc do
          is_expected.to eq 201
          expect(response.body).to_not have_json_path('error')
          expect(@user.check_ins.where(bound: bounds[0])).to be_present
        end
      end

      context 'w/ invalid beacon id' do
        let(:id) do
          id = bounds.last.id
          ids = Bound.pluck(:id)
          loop { return id unless ids.include?(id+=1) }
        end
        it 'returns 404 not found' do
          is_expected.to eq 404
          json = response.body
          expect(json).to have_json_path('error')
          expect(json).to have_json_path('error/message')
          expect(json).to be_json_eql(%("That bound does not exist.")).at_path('error/message')
        end
      end
    end
  end
end
