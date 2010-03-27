class PasswordReset

  attr_accessor :email, :password, :user, :new_record, :errors

  def self.find(token)
    user = User.find_using_perishable_token(token)
    raise ActiveRecord::RecordNotFound if user.nil?
    pr = self.new(nil)
    pr.user = user
    pr.new_record = false
    pr
  end

  def initialize(options)
    if options
      self.user = User.find_by_email(options[:email])
      self.new_record = true
    end
  end

  alias_method :new_record?, :new_record

  def update_attributes(attrs)
    attrs.each do |field, value|
      self.send("#{field}=", value)
    end
    save
  end

  def errors
    @errors ||= {}
  end

  def validate
    if new_record? and user.nil?
      errors[:email] = "was not found in our system."
    end
    errors
  end

  def valid?
    validate.empty?
  end

  def save
    return false unless valid?
    if new_record?
      user.reset_perishable_token!
      UserMailer.deliver_password_reset_notification(user)
      true
    else
      user.password = self.password
      user.save!
    end
  end
end
