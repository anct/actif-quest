require 'rails_helper'

RSpec.describe 'Treasures API', type: :request do

  let!(:treasures) { FactoryGirl.create_list(:treasure, 5) }

  describe 'GET /api/treasures' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      it 'returns 200 ok', :autodoc do
        is_expected.to eq 200
        json = response.body
        expect(json).to have_json_type(Array)
        expect(json).to have_json_size(5)
      end
    end
  end

  describe 'GET /api/treasures/:id' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      let(:treasure) { treasures[0] }
      let(:id) { treasure.id }
      context 'when the treasure exists' do
        it 'returns 200 ok', :autodoc do
          is_expected.to eq 200
          json = response.body
          expect(json).to be_json_eql(treasure.id).at_path('id')
          expect(json).to be_json_eql(%("#{treasure.name}")).at_path('name')
          expect(json).to be_json_eql(%("#{treasure.description}")).at_path('description')
          # TODO: あとで画像URLのテストも追記する
          # expect(json).to be_json_eql(%("#{treasure.image_url}")).at_path('imageUrl')
          expect(json).to have_json_path('bound')
          expect(json).to_not have_json_path('error')
        end
      end

      context 'when the treasure does not exist' do
        let(:id) do
          ids = Treasure.pluck(:id)
          id = ids.last || 1
          loop { return id unless ids.include?(id+=1) }
        end
        it 'returns 404 not found' do
          is_expected.to eq 404
          json = response.body
          expect(json).to have_json_path('error')
          expect(json).to have_json_path('error/message')
          expect(json).to be_json_eql(%("That treasure does not exist.")).at_path('error/message')
        end
      end
    end
  end

  describe 'POST /api/treasures/:id/take' do
    context 'w/ Authorization header' do
      before { @user = sign_in_as_user_with_token }
      context 'when the treasure has not yet taken' do
        let(:id) { treasures[0].id }
        it 'returns 201 created', :autodoc do
          is_expected.to eq 201
          json = response.body
          expect(json).to have_json_path('id')
          expect(json).to be_json_eql(id).at_path('id')
          expect(json).to_not have_json_path('error')
        end
      end

      context 'when the treasure already taken' do
        let(:id) do
          treasures[0].tap { |treasure| @user.taken_treasures.create(treasure: treasure) }.id
        end
        it 'returns 409 conflict' do
          is_expected.to eq 409
          json = response.body
          expect(json).to have_json_path('error')
          expect(json).to have_json_path('error/message')
          expect(json).to be_json_eql(%("That treasure has already taken by current user.")).at_path('error/message')
        end
      end

      context 'when the treasure does not exist' do
        let(:id) do
          ids = Treasure.pluck(:id)
          id = ids.last || 1
          loop { return id unless ids.include?(id+=1) }
        end
        it 'returns 404 not found' do
          is_expected.to eq 404
          json = response.body
          expect(json).to have_json_path('error')
          expect(json).to have_json_path('error/message')
          expect(json).to be_json_eql(%("That treasure does not exist.")).at_path('error/message')
        end
      end
    end
  end
end
