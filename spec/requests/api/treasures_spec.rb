require 'rails_helper'

RSpec.describe 'Treasures API', type: :request do

  let!(:treasures) { FactoryGirl.create_list(:treasures, 5) }

  describe 'GET /api/treasures' do
    context 'w/ Authorization header' do
      it 'returns 200 ok', :autodoc
    end
  end

  describe 'GET /api/treasures/:id' do
    context 'w/ Authorization header' do
      context 'when the treasure exists' do
        it 'returns 200 ok', :autodoc
      end

      context 'when the treasure does not exist' do
        it 'returns 404 not found'
      end
    end
  end

  describe 'POST /api/treasures/:id/take' do
    context 'w/ Authorization header' do
      context 'when the treasure has not yet taken' do
        it 'returns 201 created', :autodoc
      end

      context 'when the treasure has not yet taken' do
        it 'returns 409 conflict'
      end

      context 'when the treasure does not exist' do
        it 'returns 404 not found'
      end
    end
  end
end
