require 'rails_helper'

RSpec.describe Admin::NotificationsController, :type => :controller do

  describe 'GET #index' do
    it_behaves_like 'check status in #index of management screen'
  end

  describe 'GET #show' do
    it_behaves_like 'check status in #index of management screen', Notification
  end

  describe 'GET #new' do
    it_behaves_like 'check status in #new of management screen'
  end

  describe 'GET #edit' do
    it_behaves_like 'check status in #edit of management screen', Notification
  end

  describe 'POST #create' do
    it_behaves_like 'check status in #create of management screen', Notification
  end

  describe 'PATCH #update' do
    it_behaves_like 'check status in #update of management screen', Notification
  end

  describe 'DELETE #destroy' do
    it_behaves_like 'check status in #destroy of management screen', Notification
  end
end
