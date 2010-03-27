require 'spec_helper'

describe User do
  it 'should be an authorizable user' do
    u = User.new
    u.should respond_to(:password)
    u.should respond_to(:reset_password)
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
