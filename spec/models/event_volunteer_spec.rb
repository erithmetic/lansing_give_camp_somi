require 'spec_helper'

describe EventVolunteer do
  before(:each) do
    @event = Factory.create(:event)
  end
  it 'should support nested attributes for users' do
    ev = EventVolunteer.new(:user_attributes => Factory.attributes_for(:user), :event_id => @event.id)
    ev.save!
    ev.user_id.should_not be_nil
  end
  
  describe 'validations' do
    it 'should prevent a user from signing up for the same event twice' do
      user = Factory.create(:user)
      EventVolunteer.create!(:user => user, :event => @event)
      ev = EventVolunteer.new(:user => user, :event => @event)
      ev.should_not be_valid
    end
    it 'should allow a user to sign up for different events' do
      user = Factory.create(:user)
      EventVolunteer.create!(:user => user, :event => @event)
      ev = EventVolunteer.new(:user => user, :event => Factory.create(:event))
      ev.should_not be_valid
    end
  end
end
