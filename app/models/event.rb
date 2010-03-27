class Event < ActiveRecord::Base
	has_many :users, :through => :event_volunteers
	has_many :event_volunteers

  def time
    date.strftime("%H:%M:%S")
  end
end
