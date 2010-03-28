class EventVolunteer < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

  named_scope :sort_by_name do
    :all
    def get
      self.all.sort { |a, b| a.sortable_name <=> b.sortable_name }
    end
  end

  before_validation :assign_alternates

  validate :prevent_signup_for_past_event
  validates_numericality_of :number_in_group, :greater_than => 0

  accepts_nested_attributes_for :user

  default_value_for :number_in_group, 1
  default_value_for :alternate, false

  def sortable_name
    name = user.group || user.name || user.email
  end

  def confirmed?
    confirmed
  end

private
  def assign_alternates
    if number_in_group.to_i == 1 && event.would_be_full?(1)
      self.alternate = true
    end
  end

  def prevent_signup_for_past_event
    if event.past?
      errors.add(:event, :message => "cannot sign up for a past event")
    end
  end
end
