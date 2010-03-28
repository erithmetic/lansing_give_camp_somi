require 'spec_helper'

describe User do
  describe 'callbacks' do
    describe :reset_blank_password do
      it 'should reset the password if a newly created user password is blank' do
        u = User.new(:email => 'foo@bar.com')
        u.should_receive(:reset_password).and_return('fooble')
        u.save
      end
      it 'should not reset the password if it is not blank' do
        u = User.create(:email => 'foo@bar.com', :password => 'mine')
        u.password.should == 'mine'
      end
      it 'should not reset the password for an existing user' do
        u = User.create(:email => 'foo@bar.com', :password => 'mine')
        u.reload
        u.should_not_receive(:reset_password)
        u.save
      end
    end

    describe :send_signup_notification do
      it 'should send a signup notification on a newly saved record' do
        u = Factory.build(:user)
        UserMailer.should_receive(:deliver_registration_notification)
        u.save
      end
      it 'should not send a signup notification on an updated record' do
        Factory.create(:user)
        u = User.all.first
        u.should_not_receive(:deliver_registration_notification)
        u.save
      end
    end
  end

  describe :signed_up_for? do
    it 'should return true if a user is signed up for the given event' do
      user = Factory.create(:user)
      event = user.events.create!(Factory.attributes_for(:event))
      user.signed_up_for?(event).should be_true
    end
    it 'should return false if a user is not signed up for the given event' do
      user = Factory.create(:user)
      event = user.events.create!(Factory.attributes_for(:event))
      event2 = Factory.create(:event)
      user.signed_up_for?(event2).should be_false
    end
  end
end
