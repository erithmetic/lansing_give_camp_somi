require 'spec_helper'

describe EventVolunteersController do
  describe 'POST /event_volunteers' do
    before(:each) { @event = Factory.create(:event) }

    it 'should create a signup for a logged in user' do
      user = Factory.create(:user)
      log_in(user)
      post 'create', :event_id => @event.id
    end
    it 'should create a signup for a new user and log them in' do
      lambda do
        post 'create', :event_id => @event.id, :event_volunteer => {
          :user_attributes => { :email => 'fonzie@happydays.net',
            :password => 'heyyyy', :spamValidation => '2010' }
        }
      end.should change(User, :count).by(1)
    end
    it 'should create a signup for a new user' do
      lambda do
        post 'create', :event_id => @event.id, :event_volunteer => {
          :user_attributes => { :email => 'fonzie@happydays.net',
            :password => 'heyyyy', :spamValidation => '2010' }
        }
      end.should change(EventVolunteer, :count).by(1)
    end
    it 'should create a signup for a new user without a password' do
      lambda do
        post 'create', :event_id => @event.id, :event_volunteer => {
          :user_attributes => { :email => 'fonzie@happydays.net',
                                :spamValidation => '2010' }
        }
      end.should change(User, :count).by(1)
    end
    it 'should prevent someone from signing up for a past event' do
      @event.date = Time.now - 2.hours
      @event.save
      log_in(Factory.create(:user))

      lambda do
        post 'create', :event_id => @event.id
      end.should_not change(EventVolunteer, :count)
    end
    it 'should prevent someone from signing up multiple times' do
      log_in(Factory.create(:user))

      lambda do
        post 'create', :event_id => @event.id
      end.should change(EventVolunteer, :count).by(1)

      [:@object, :@parent_object].each { |iv| controller.instance_variable_set(iv, nil) }
      lambda do
        post 'create', :event_id => @event.id
      end.should_not change(EventVolunteer, :count)
    end
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
