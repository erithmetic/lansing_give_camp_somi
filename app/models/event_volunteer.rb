class EventVolunteer < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

  accepts_nested_attributes_for :user
end
