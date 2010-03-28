class EventVolunteersController < ResourceController::Base
  actions :index, :create, :destroy
  belongs_to :event

  before_filter :require_user, :only => [:destroy, :check_in]
  before_filter :require_admin_or_owner, :only => [:destroy, :check_in]

  create do
    before do
      object.user = current_user if object.user.nil?
    end
    after do
      UserSession.create(object.user) if current_user.nil?
      EventVolunteerMailer.deliver_event_signup_notification(object)
    end
    success.flash { "You have signed up for #{parent_object.title}" }
    success.wants.html { redirect_to root_url }
    failure.flash { "Sorry, there was a problem signing you up" }
    failure.wants.html do
      @object = parent_object
      @parent_object = nil
      render :template => 'events/show'
    end
  end
  destroy.wants.html { redirect_to root_url }

  def check_in
    ids = params[:event_volunteer_ids].map(&:to_i)
    originally_confirmed = EventVolunteer.find(:all, :conditions => { :confirmed => true, :event_id => parent_object.id })
    originally_confirmed = originally_confirmed.map(&:id)
    new_ids = ids - originally_confirmed
    EventVolunteer.update_all('confirmed = 1', ["event_id = ? AND id IN(#{ids.join(',')})", parent_object.id])
    unconfirmed = collection.map(&:id) - ids
    EventVolunteer.update_all('confirmed = 0', ["event_id = ? AND id NOT IN(#{ids.join(',')})", parent_object.id])

    EventVolunteer.find(:all, :conditions => "id IN (#{new_ids.join(',')})").each do |new_ev|
      EventVolunteerMailer.deliver_attendance_confirmation(new_ev)
    end

    redirect_to event_url(parent_object)
  end

private
  def collection
    @collection ||= end_of_association_chain.sort_by_name.get
  end

  def require_admin_or_owner
    forbid unless current_user.admin? or current_user == object.user
  end
end
