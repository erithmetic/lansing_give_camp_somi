class UserTimeBlock < ActiveRecord::Base
	belongs_to :time_block
	belongs_to :user
end
