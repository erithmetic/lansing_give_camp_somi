class TimeBlock < ActiveRecord::Base
	belongs_to :events
	has_many :users, :through => :user_time_blocks
	has_many :user_time_blocks
end
