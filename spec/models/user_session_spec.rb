require 'spec_helper'

describe UserSession do
  it 'should authenticate a user with a password' do
    user = Factory.create(:user, :email => 'user@test.com', :password => 'test')
    us = UserSession.new(:email => 'user@test.com', :password => 'test')
    us.should be_valid
    us.user.should == user
  end

  it 'should authenticate a user without a password, if the user is a new record' do
    user = Factory.create(:user, :email => 'user@test.com', :password => 'test')
    us = UserSession.new(:email => 'user@test.com', :password => 'test')
    us.should be_valid
    us.user.should == user
  end
end
