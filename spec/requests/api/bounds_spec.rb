require 'rails_helper'

RSpec.describe 'Bounds API', type: :request do

  let!(:bounds) { FactoryGirl.create_list(:bound, 5) }

  describe '#index' do
    before { get api_bounds_path }
    it { expect(response).to be_success }
    it { expect(response.status).to eq 200 }

    describe 'response body' do
      subject { response.body }
      it { is_expected.to have_json_type(Array) }
      it { is_expected.to have_json_size(5) }
    end
  end
end