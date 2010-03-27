require 'spec_helper'

describe EventVolunteer do
  it 'should support nested attributes for users' do
    event = Factory.create(:event)
    ev = EventVolunteer.new(:user_attributes => Factory.attributes_for(:user), :event_id => event.id)
    ev.save!
    ev.user_id.should_not be_nil
  end
end
