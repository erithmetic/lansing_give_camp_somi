class EventVolunteerMailer < ActionMailer::Base
  def event_signup_notification(event_volunteer)
    user = event_volunteer.user
    event = event_volunteer.event
    recipients user.email
    from       'meredithda8@aol.com'
    subject    "You're signed up for #{event.title}"
    body       :user => user, :event => event
  end
end
