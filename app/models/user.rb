class User < ActiveRecord::Base
	has_many :events, :through => :event_volunteers
	has_many :event_volunteers

	has_many :time_blocks, :through => :user_time_blocks
	has_many :user_time_blocks
end
