require 'rails_helper'

RSpec.describe Admin::GroupsController, type: :controller do

  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to be_success }
  end

  describe 'GET #show' do
    let(:group) { FactoryGirl.create(:group) }
    subject { get :show, id: group }

    it { is_expected.to be_success }
  end

  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to be_success }
  end

  describe 'GET #edit' do
    let(:group) { FactoryGirl.create(:group) }
    subject { get :edit, id: group }

    it { is_expected.to be_success }
  end

  describe 'POST #create' do
    let(:group) { FactoryGirl.create(:group) }
    it do
      expect {
        post :create, group: FactoryGirl.attributes_for(:group)
      }.to change(Group, :count).by(1)
    end
  end

  describe 'PATCH #update' do
    let!(:group) { FactoryGirl.create(:group) }
    let!(:group_params) { FactoryGirl.attributes_for(:group) }
    before { patch :update, id: group, group: group_params }
    it do
      group.reload
      expect(group.name).to eq group_params[:name]
    end
  end

  describe 'DELETE #destroy' do
    let!(:group) { FactoryGirl.create(:group) }
    it do
      expect {
        delete :destroy, id:group
      }.to change(Group, :count).by(-1)
    end
  end
end
