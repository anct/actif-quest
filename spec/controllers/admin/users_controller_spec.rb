require 'rails_helper'

RSpec.describe Admin::UsersController, :type => :controller do

  describe 'GET #index' do
    it_behaves_like 'check status in #index of management screen'
  end

  describe 'GET #show' do
    it_behaves_like 'check status in #index of management screen', User
  end

  describe 'DELETE #destroy' do
    it_behaves_like 'check status in #destroy of management screen', User
  end
end
