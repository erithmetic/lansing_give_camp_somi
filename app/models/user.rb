class User < ActiveRecord::Base
	has_many :events, :through => :event_volunteers
	has_many :event_volunteers

	has_many :time_blocks, :through => :user_time_blocks
	has_many :user_time_blocks

  HUMANIZED_ATTRIBUTES = {
    :spamValidation => ""
  }

  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  before_validation :reset_blank_password

  attr_accessor :password_confirmation
  attr_accessor :spamValidation
  
  validates_format_of :spamValidation, :with => /\A\d{2,4}\Z/,:message => "You didn't enter the correct year"
  

  acts_as_authentic do |c|
    c.login_field :email
    c.ignore_blank_passwords true
    c.require_password_confirmation false
  end

  def admin?
    admin
  end

  def signed_up_for?(event)
    events.include?(event)
  end
  


private
  def reset_blank_password
    if new_record? && password.blank?
      reset_password
    end
  end
end
