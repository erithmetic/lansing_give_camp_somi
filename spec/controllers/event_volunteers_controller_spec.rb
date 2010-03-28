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
      response.should be_redirect
    end
    it 'should create a signup for a new user' do
      lambda do
        post 'create', :event_id => @event.id, :event_volunteer => {
          :user_attributes => { :email => 'fonzie@happydays.net',
            :password => 'heyyyy', :spamValidation => '2010' }
        }
      end.should change(EventVolunteer, :count).by(1)
      response.should be_redirect
    end
    it 'should create a signup for a new user without a password' do
      lambda do
        post 'create', :event_id => @event.id, :event_volunteer => {
          :user_attributes => { :email => 'fonzie@happydays.net',
                                :spamValidation => '2010' }
        }
      end.should change(User, :count).by(1)
      response.should be_redirect
    end
    it 'should prevent someone from signing up for a past event' do
      @event.date = Time.now - 2.hours
      @event.save
      log_in(Factory.create(:user))

      lambda do
        post 'create', :event_id => @event.id
      end.should_not change(EventVolunteer, :count)
      response.should be_success
    end
    it 'should prevent someone from signing up multiple times' do
      pending "we find a way that doesn't preclude one from signing up for multiple other events"
      log_in(Factory.create(:user))

      lambda do
        post 'create', :event_id => @event.id
      end.should change(EventVolunteer, :count).by(1)

      [:@object, :@parent_object].each { |iv| controller.instance_variable_set(iv, nil) }
      lambda do
        post 'create', :event_id => @event.id
      end.should_not change(EventVolunteer, :count)
      response.should be_success
    end
    it 'should make any single volunteers above the limit alternates' do
      user = log_in
      @event.maximum_volunteers = 1
      @event.event_volunteers.create(:user => Factory.create(:user))
      @event.save

      post 'create', :event_id => @event.id, :event_volunteer => { :number_in_group => '1' }
      @event.reload
      @event.event_volunteers.find_by_user_id(user.id).should be_alternate
    end
    it 'should not make any group volunteers above the limit alternates' do
      log_in
      @event.maximum_volunteers = 10
      @event.save

      post 'create', :event_id => @event.id, :event_volunteer => { :number_in_group => '11' }
      @event.reload
      @event.event_volunteers.first.should_not be_alternate
    end
    it 'should sign up a group of volunteers' do
      user = log_in

      post 'create', :event_id => @event.id, :event_volunteer => { :number_in_group => '14' }
      response.should be_redirect

      @event.reload
      @event.event_volunteers.first.number_in_group.should == 14
    end
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

  describe 'PUT /event_volunteers/check_in' do
    before(:each) do
      @event = Factory.create(:event)
      @ev1 = @event.event_volunteers.create(:user => Factory.create(:user))
      @ev2 = @event.event_volunteers.create(:user => Factory.create(:user))
      @ev3 = @event.event_volunteers.create(:user => Factory.create(:user))
      log_in(Factory.create(:user, :admin => true))
      @all = [@ev1, @ev2, @ev3]
    end
    it 'should set confirmed signups' do
      ids = [@ev1, @ev3].map(&:id).map(&:to_s)
      put 'check_in', :event_id => @event.id, :event_volunteer_ids => ids
      @all.map(&:reload)
      @ev1.should be_confirmed
      @ev2.should_not be_confirmed
      @ev3.should be_confirmed
    end
    it 'should unset unconfirmed signups' do
      @all.each do |ev|
        ev.confirmed = true
        ev.save
      end
      ids = [@ev2].map(&:id)
      put 'check_in', :event_id => @event.id, :event_volunteer_ids => ids
      @all.map(&:reload)
      @ev1.should_not be_confirmed
      @ev2.should be_confirmed
      @ev3.should_not be_confirmed
    end
    it 'should only send emails to new attenders' do
      [@ev1, @ev3].each do |ev|
        ev.confirmed = true
        ev.save
      end
      ids = @all.map(&:id)
      EventVolunteerMailer.should_receive(:deliver_attendance_confirmation).once
      put 'check_in', :event_id => @event.id, :event_volunteer_ids => ids
    end
  end
end
