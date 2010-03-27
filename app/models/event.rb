class Event < ActiveRecord::Base
	has_many :users, :through => :event_volunteers
	has_many :event_volunteers
	has_many :time_blocks

  validates_presence_of :title
  validates_numericality_of :number_of_hours, :greater_than => 0
  validates_numericality_of :minimum_volunteers, :only_integer => true,
                            :greater_than_or_equal_to => 0

  def time
    date.strftime("%H:%M:%S")
  end
end
