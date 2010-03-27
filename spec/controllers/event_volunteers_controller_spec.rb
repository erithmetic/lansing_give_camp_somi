require 'spec_helper'

describe EventVolunteersController do
  describe 'POST /event_volunteers' do
    it 'should create a signup' do
      user = Factory.create(:user)
      event = Factory.create(:event)
      log_in(user)
      post 'create', :event_id => event.id
    end
    it 'should prevent someone from signing up for a past event'
    it 'should make any volunteers above the limit alternates'
  end

  describe 'DELETE /event_volunteers/1' do
    before(:each) do
      @event = Factory.create(:event)
    end
    it 'should allow an unregistration' do
      user = Factory.create(:user)
      ev = user.event_volunteers.create(:event => @event)
      user.save
      log_in(user)

      delete 'destroy', :id => ev.id
      response.should be_redirect

      user.reload
      user.events.should be_empty
    end
    it 'should not allow someone to unregister another'
    it 'should allow admins to unregister another'
  end
end
