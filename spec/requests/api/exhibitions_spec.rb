require 'rails_helper'

RSpec.describe 'Exhibitions API', type: :request do

  let!(:exhibitions) { FactoryGirl.create_list(:exhibition, 5) }

  describe '#index' do
    before { get api_exhibitions_path }
    it { expect(response).to be_success }
    it { expect(response.status).to eq 200 }

    describe 'response body' do
      subject { response.body }
      it { is_expected.to have_json_type(Array) }
      it { is_expected.to have_json_size(5) }
    end
  end

  describe '#show' do
    let(:exhibition) { exhibitions[0] }
    before { get api_exhibition_path(exhibition) }
    it { expect(response).to be_success }
    it { expect(response.status).to eq 200 }

    describe 'response body' do
      subject { response.body }
      it { is_expected.to have_json_type(Hash) }
      it { is_expected.to be_json_eql(exhibition.id).at_path('id') }
      it { is_expected.to be_json_eql("\"#{exhibition.name}\"").at_path('name') }
      it { is_expected.to be_json_eql("\"#{exhibition.introduction}\"").at_path('introduction') }
      it { is_expected.to include_json(exhibition.group.to_json) }
      it { is_expected.to have_json_path('image') }
    end
  end

end
