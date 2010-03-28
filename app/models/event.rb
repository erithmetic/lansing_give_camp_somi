class Event < ActiveRecord::Base
	has_many :users, :through => :event_volunteers, :class_name => 'User'
	has_many :event_volunteers
	has_many :time_blocks

  named_scope :past, :conditions => ['date <= ?', Time.now]
  named_scope :upcoming, :conditions => ['date > ?', Time.now]

  validates_presence_of :title
  validates_numericality_of :number_of_hours, :greater_than => 0, :allow_nil => true
  validates_numericality_of :minimum_volunteers, :only_integer => true,
                            :greater_than_or_equal_to => 0, :allow_nil => true

  def timeWithDuration
  	laterDate = date + number_of_hours.hours
  	
  	if number_of_hours <= 1
  		hourOrHours = "hour"
  	else
  		hourOrHours = "hours"
  	end
  	
	return date.strftime("%I:%M %p")+" - "+laterDate.strftime("%I:%M %p")+" (%i "%number_of_hours+hourOrHours+" )" 

  end
end
