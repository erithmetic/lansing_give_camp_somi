class User < ActiveRecord::Base
	has_many :events, :through => :event_volunteers
	has_many :event_volunteers

	has_many :time_blocks, :through => :user_time_blocks
	has_many :user_time_blocks

  before_validation :reset_blank_password

  attr_accessor :password_confirmation

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
