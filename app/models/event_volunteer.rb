class EventVolunteer < ActiveRecord::Base
	belongs_to :event
	belongs_to :user
	has_one :time_block
end
