require 'spec_helper'

describe SessionsController do
  describe 'GET /sessions/new' do
    it 'should show the form' do
      get 'new'
      response.should be_success
    end
  end

  describe 'POST /sessions' do
    it 'should log in a user' do
      user = Factory.create(:user, :email => 'loyd@cameraobscura.com', :password => 'test')

      post 'create', :user_session => { :email => 'loyd@cameraobscura.com', :password => 'test' }

      response.should be_redirect
      controller.current_person.should == user
    end
  end
end
