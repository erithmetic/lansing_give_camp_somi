class UserMailer < ActionMailer::Base
  def password_reset_notification(user)
    recipients user.email
    from       'info@somi8.org'
    subject    "Password reset"
    body       :user => user
  end
end
