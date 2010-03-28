require 'spec_helper'
require 'time'

describe Event do
  describe 'validations' do
    it 'should not allow a past event on creation' do
      event = Factory.build(:event, :date => Time.now - 8.hours)
      event.should_not be_valid
    end
    it 'should allow a past event on update' do
      event = Factory.create(:event, :date => Time.now + 8.hours)
      event.date += 8.hours
      event.should be_valid
    end
    it 'should allow a future event' do
      event = Factory.build(:event, :date => Time.now + 8.hours)
      event.should be_valid
    end
  end

  describe :timeWithDuration do
    it 'should return the time' do
      event = Event.new(:date => Time.parse('2010-03-27 13:45:01'), :number_of_hours => 4)
      event.timeWithDuration.should == '05:45 PM - 09:45 PM (4 hours )'
    end
  end

  describe :past? do
    it 'should return true for a past event' do
      event = Event.new(:date => Time.parse('2010-03-27 13:45:01'))
      event.should be_past
    end
    it 'should return false for a current event' do
      event = Event.new(:date => Time.now + 3.hours)
      event.should_not be_past
    end
  end
end
