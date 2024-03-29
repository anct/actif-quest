require 'rails_helper'

RSpec.describe 'Exhibitions API', type: :request do

  let!(:exhibitions) { FactoryGirl.create_list(:exhibition, 5) }

  describe 'GET /api/exhibitions' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it 'returns the exhibitions', :autodoc do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
        expect(json).to_not have_errors
      end
    end

    it_behaves_like 'w/o Authorization header'
  end

  describe 'GET /api/exhibitions/:id' do
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }
      context 'w/ valid exhibition id' do
        let(:exhibition) { exhibitions[0] }
        let(:id) { exhibitions[0].id }

        it 'returns the exhibition', :autodoc do
          is_expected.to eq 200
          json = response.body
          expect(json).to have_json_type(Hash)
          expect(json).to be_json_eql(exhibition.id).at_path('id')
          expect(json).to be_json_eql("\"#{exhibition.name}\"").at_path('name')
          expect(json).to be_json_eql("\"#{exhibition.introduction}\"").at_path('introduction')
          expect(json).to include_json(exhibition.group.to_json)
          expect(json).to have_json_path('image')
          expect(json).to_not have_errors
        end
      end

      context 'w/ invalid exhibition id' do
        let(:id) { not_existed_id(Exhibition) }
        it 'returns 404 not found' do
          is_expected.to eq 404
          expect(response.body).to have_error_message('That exhibition does not exist.')
        end
      end
    end

    it_behaves_like 'w/o Authorization header' do
      let(:id) { exhibitions[0].id }
    end
  end

  describe 'POST /api/exhibitions/:id/vote' do
    context 'w/ Authozization header' do
      before { @user = sign_in_as_user_with_token }
      context 'w/ valid exhibition id' do
        let(:exhibition) { exhibitions[0] }
        let(:id) { exhibition.id }
        context 'have not yet voted' do
          it 'returns 201 created', :autodoc do
            is_expected.to eq 201
            expect(response.body).to_not have_errors
            expect(@user.votes.where(votable: exhibition)).to be_present
          end
        end

        context 'have already voted' do
          before { @user.votes.create(votable: exhibition) }
          it 'returns 409 conflict' do
            is_expected.to eq 409
            expect(response.body).to have_error_message('That exhibition have already voted.')
          end
        end
      end

      context 'w/ invalid exhibition id' do
        let(:id) { not_existed_id(Exhibition) }
        it 'returns 404 not found' do
          is_expected.to eq 404
          expect(response.body).to have_error_message('That exhibition does not exist.')
        end
      end
    end

    it_behaves_like 'w/o Authorization header' do
      let(:id) { exhibitions[0].id }
    end
  end
end
