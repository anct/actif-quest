require 'rails_helper'

RSpec.describe Admin::AdminsController, :type => :controller do

  describe 'GET #index' do
    it_behaves_like 'check status in #index of management screen'
  end

  describe 'GET #show' do
    it_behaves_like 'check status in #index of management screen', Admin
  end

  describe 'GET #new' do
    it_behaves_like 'check status in #new of management screen'
  end

  describe 'POST #create' do
    before { sign_in_as_admin }
    let(:admin_params) { FactoryGirl.attributes_for(:admin) }
    it { expect { post :create, admin: admin_params }.to change(Admin, :count).by(1) }
  end

  describe 'DELETE #destroy' do
    it_behaves_like 'check status in #destroy of management screen', Admin
  end
end
