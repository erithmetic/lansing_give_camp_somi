class Event < ActiveRecord::Base
	has_many :users, :through => :event_volunteers, :class_name => 'User'
	has_many :event_volunteers
	has_many :time_blocks

  named_scope :past, :conditions => 'date <= NOW()'
  named_scope :upcoming, :conditions => 'date > NOW()'

  validates_presence_of :title
  validates_numericality_of :number_of_hours, :greater_than => 0, :allow_nil => true
  validates_numericality_of :minimum_volunteers, :only_integer => true,
                            :greater_than_or_equal_to => 0, :allow_nil => true

  def time
    date.strftime("%H:%M:%S")
  end
end
