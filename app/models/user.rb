class User < ActiveRecord::Base
	has_many :events, :through => :event_volunteers
	has_many :event_volunteers
end
