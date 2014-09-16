require 'rails_helper'

RSpec.describe Admin::ExhibitionsController, type: :controller do

  describe 'GET #index' do
    subject { get :index }
    it { is_expected.to be_success }
  end

  describe 'GET #show' do
    let(:exhibition) { FactoryGirl.create(:exhibition) }
    subject { get :show, id: exhibition }

    it { is_expected.to be_success }
  end

  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to be_success }
  end

  describe 'GET #edit' do
    let(:exhibition) { FactoryGirl.create(:exhibition) }
    subject { get :edit, id: exhibition }

    it { is_expected.to be_success }
  end

  describe 'POST #create' do
    let(:group) { FactoryGirl.create(:group) }
    it do
      expect {
        post :create, exhibition: FactoryGirl.attributes_for(:exhibition, group_id: group.id)
      }.to change(Exhibition, :count).by(1)
    end
  end

  describe 'PATCH #update' do
    let!(:exhibition) { FactoryGirl.create(:exhibition) }
    let!(:exhibition_params) { FactoryGirl.attributes_for(:exhibition) }
    before do
      patch :update, id: exhibition, exhibition: exhibition_params
      exhibition.reload
    end

    it { expect(exhibition.name).to eq exhibition_params[:name] }
    it { expect(exhibition.introduction).to eq exhibition_params[:introduction] }
  end

  describe 'DELETE #destroy' do
    let!(:exhibition) { FactoryGirl.create(:exhibition) }
    it do
      expect {
        delete :destroy, id: exhibition
      }.to change(Exhibition, :count).by(-1)
    end
  end
end
