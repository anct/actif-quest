require 'rails_helper'

RSpec.describe 'Exhibitions API', type: :request do

  let!(:exhibitions) { FactoryGirl.create_list(:exhibition, 5) }

  describe 'GET /api/exhibitions' do
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

  describe 'GET /api/exhibitions/:id' do
    let(:exhibition) { exhibitions[0] }
    let(:id) { exhibitions[0].id }
    context 'w/ Authozization header' do
      before { sign_in_as_user_with_token }

      it do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Hash)
        expect(json).to be_json_eql(exhibition.id).at_path('id')
        expect(json).to be_json_eql("\"#{exhibition.name}\"").at_path('name')
        expect(json).to be_json_eql("\"#{exhibition.introduction}\"").at_path('introduction')
        expect(json).to include_json(exhibition.group.to_json)
        expect(json).to have_json_path('image')
      end
    end
  end

end
