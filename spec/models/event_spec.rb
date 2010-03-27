require 'spec_helper'
require 'time'

describe Event do
  describe :time do
    it 'should return the time' do
      event = Event.new(:date => Time.parse('2010-03-27 13:45:01'))
      event.time.should == '17:45:01'
    end
  end
end
