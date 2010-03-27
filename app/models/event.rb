class Event < ActiveRecord::Base
	has_many :users, :through => :event_volunteers
	has_many :event_volunteers
	has_many :time_blocks

  def time
    date.strftime("%H:%M:%S")
  end
end
