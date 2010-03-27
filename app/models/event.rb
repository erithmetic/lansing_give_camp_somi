class Event < ActiveRecord::Base
	has_many :users, :through => :event_volunteers, :class_name => 'User'
	has_many :event_volunteers
	has_many :time_blocks

	accepts_nested_attributes_for :users, :allow_destroy => true

  def time
    date.strftime("%H:%M:%S")
  end
end
