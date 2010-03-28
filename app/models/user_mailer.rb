class UserMailer < ActionMailer::Base
  def password_reset_notification(user)
    recipients user.email
    from       'meredithda8@aol.com'
    subject    "Password reset"
    body       :user => user
  end

  def registration_notification(user)
    recipients user.email
    from       'meredithda8@aol.com'
    subject    "Special Olympics Michigan Signup"
    body       :user => user
  end
end
