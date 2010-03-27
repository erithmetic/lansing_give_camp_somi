require 'spec_helper'

describe PasswordResetsController do
  before(:each) do
    @user = Factory.create(:user)
  end

  describe 'POST /password_resets' do
    it 'should be successful' do
      UserMailer.should_receive(:deliver_password_reset_notification)
      post 'create', :password_reset => { :email => @user.email }
      response.should be_success
    end
    it 'should redisplay form when an unknown email is entered' do
      UserMailer.should_not_receive(:deliver_password_reset_notification)
      post 'create', :password_reset => { :email => 'jibba@jabba.com' }
      response.should be_success
    end
    it 'should accept a email for lookup' do
      UserMailer.should_receive(:deliver_password_reset_notification)
      post 'create', :password_reset => { :email => @user.email }
      response.should be_success
    end
  end

  describe 'GET /password_resets/:id/edit' do
    before(:each) do
      @user.reset_perishable_token!
    end
    it 'should block an invalid token' do
      lambda do
        get 'edit', :id => 'banana_coin'
      end.should raise_error(ActiveRecord::RecordNotFound)
    end
    it 'should allow a valid token' do
      get 'edit', :id => @user.perishable_token
      response.should be_success
    end
  end

  describe 'PUT /password_resets/:id' do
    before(:each) do
      @user.reset_perishable_token!
    end
    it 'should be successful' do
      put 'update', :id => @user.perishable_token, 
        :password_reset => { :password => 'gadzooks' }
      response.should be_redirect
    end
    it 'should be not found for an invalid token' do
      lambda do
        put 'update', :id => 'banana_coin', :password_reset => { :password => 'gadzooks' }
      end.should raise_error(ActiveRecord::RecordNotFound)
    end
    it 'should log in the user' do
      controller.should_receive(:login_user)
      put 'update', :id => @user.perishable_token, 
        :password_reset => { :password => 'gadzooks' }
    end
  end
end
