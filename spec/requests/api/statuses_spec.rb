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
        expect(json).to_not have_errors
      end
    end

    it_behaves_like 'w/o Authorization header'
  end

  describe 'POST /api/statuses' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }
      context 'w/ valid body' do
        let(:params) { { status: FactoryGirl.attributes_for(:status) } }
        it 'returns 201 created', :autodoc do
          is_expected.to eq 201
          json = response.body
          expect(json).to_not have_errors
          expect(json).to be_json_eql(%("#{params[:status][:body]}")).at_path('body')
        end
      end

      context 'when body is too long' do
        let(:params) { { status: { body: 'a' * 256 } } }
        it 'returns 404 bad request' do
          is_expected.to eq 400
          expect(response.body).to have_error_message('That status body is invalid.')
        end
      end

      context 'when body is empty' do
        let(:params) { { status: { body: '' } } }
        it 'returns 404 bad request' do
          is_expected.to eq 400
          expect(response.body).to have_error_message('That status body is empty.')
        end
      end
    end

    it_behaves_like 'w/o Authorization header'
  end

  describe 'DELETE /api/statuses/:id' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      context 'when the status is user\'s' do
        let(:id) { FactoryGirl.create(:status, user: @user).id }
        it 'returns 204 no content', :autodoc do
          is_expected.to eq 204
          expect(response.body).to be_blank
          expect(Status.where(id: id)).to be_empty
          expect(response.body).to_not have_errors
        end
      end

      context 'when the status does not exist' do
        let(:id) { not_existed_id(Status) }
        it 'returns 404 not found' do
          is_expected.to eq 404
          expect(response.body).to have_error_message('That status does not exist.')
        end
      end

      context 'when the status is not user\'s' do
        let(:id) do
          other_user = FactoryGirl.create(:user)
          FactoryGirl.create(:status, user: other_user).id
        end
        it 'returns 403 forbidden' do
          is_expected.to eq 403
          expect(response.body).to have_error_message('That status is not current user\'s.')
        end
      end
    end

    it_behaves_like 'w/o Authorization header' do
        let(:id) { statuses[0].id }
    end
  end

  describe 'POST /api/statuses/:id/favorites' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      context 'when the status has not yet favored' do
        let(:id) { statuses[0].id }
        it 'returns 201 created', :autodoc do
          is_expected.to eq 201
          json = response.body
          expect(json).to have_json_path('id')
          expect(json).to be_json_eql(id).at_path('id')
          expect(json).to_not have_errors
        end
      end

      context'when the status has already favored' do
        let(:id) do
          statuses[0].tap { |status| @user.favorites.create(favorable: status) }.id
        end
        it 'returns 409 conflict' do
          is_expected.to eq 409
          expect(response.body).to have_error_message('That status has already favored by current user.')
        end
      end

      context 'when the status does not exist' do
        let(:id) { not_existed_id(Status) }
        it 'returns 404 not found' do
          is_expected.to eq 404
          expect(response.body).to have_error_message('That status does not exist.')
        end
      end
    end

    it_behaves_like 'w/o Authorization header' do
        let(:id) { statuses[0].id }
    end
  end

  describe 'DELETE /api/statuses/:id/favorites' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      context 'when the status has already favored' do
        let(:id) do
          statuses[0].tap { |status| @user.favorites.create(favorable: status) }.id
        end
        it 'returns 204 no content', :autodoc do
          is_expected.to eq 204
          json = response.body
          expect(json).to be_empty
          expect(json).to_not have_errors
        end
      end

      context 'when the status has not yet favored' do
        let(:id) { statuses[0].id }
        it 'returns 404 not found' do
          is_expected.to eq 404
          expect(response.body).to have_error_message('That status has not yet favored by current user.')
        end
      end

      context 'whent the status does not exist' do
        let(:id) { not_existed_id(Status) }
        it 'returns 404 not found' do
          is_expected.to eq 404
          expect(response.body).to have_error_message('That status does not exist.')
        end
      end
    end

    it_behaves_like 'w/o Authorization header' do
        let(:id) { statuses[0].id }
    end
  end
end
