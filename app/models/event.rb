class Event < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

	has_many :users, :through => :event_volunteers, :class_name => 'User'
	has_many :event_volunteers do
    def total
      self.sum(:number_in_group)
    end
  end

  named_scope :past, :conditions => ['date <= ?', Time.now], :order => 'date DESC'
  named_scope :upcoming, :conditions => ['date > ?', Time.now], :order => 'date ASC'

  validates_presence_of :title
  validates_numericality_of :number_of_hours, :greater_than => 0, :allow_nil => true
  validates_numericality_of :minimum_volunteers, :only_integer => true,
                            :greater_than_or_equal_to => 0, :allow_nil => true
  
  default_value_for :maximum_volunteers, 0
  default_value_for :minimum_volunteers, 0
  default_value_for :closed, false
  default_value_for :subject_to_cancellation, false

  def past?
    return false if date.nil?
    date <= Time.now
  end
  
  def total_volunteers
    event_volunteers.total
  end
  
  def full?
    return false if maximum_volunteers.blank?
  	return users.count >= maximum_volunteers
  end

  def under_volunteered?
    min = minimum_volunteers || 0
    total_volunteers < min
  end

  def would_be_full?(num)
    return false if maximum_volunteers.blank?
  	return users.count + num >= maximum_volunteers
  end
end
