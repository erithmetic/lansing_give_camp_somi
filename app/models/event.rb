class Event < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

	has_many :users, :through => :event_volunteers, :class_name => 'User'
	has_many :event_volunteers

  named_scope :past, :conditions => ['date <= ?', Time.now]
  named_scope :upcoming, :conditions => ['date > ?', Time.now]

  validates_presence_of :title
  validates_numericality_of :number_of_hours, :greater_than => 0, :allow_nil => true
  validates_numericality_of :minimum_volunteers, :only_integer => true,
                            :greater_than_or_equal_to => 0, :allow_nil => true
  
  default_value_for :maximum_volunteers, 0
  default_value_for :minimum_volunteers, 0

  def timeWithDuration
    return nil if date.nil?
    return date if number_of_hours.nil?

  	laterDate = date + number_of_hours.hours
  	
  	if number_of_hours <= 1
  		hourOrHours = "hour"
  	else
  		hourOrHours = "hours"
  	end
  	
    date_string = date.strftime("%I:%M %p")
    later_date_string = laterDate.strftime("%I:%M %p")
    hours = pluralize(number_of_hours, 'hour')
    "#{date_string} - #{later_date_string} ( #{number_of_hours} #{hours} )" 
  end

  def past?
    return false if date.nil?
    date <= Time.now
  end
  
  def volunteersFormatted
    max_volunteers = maximum_volunteers || 0
  	num_needed = max_volunteers - users.count
  	
  	if num_needed > 0
  		return "#{users.count} (#{num_needed} more needed)"
  	else
  		return users.count
  	end
  end
  
  def full?
  	return users.count == maximum_volunteers
  end
end
