class EventVolunteersController < ResourceController::Base
  actions :index, :create, :destroy
  belongs_to :event

  before_filter :require_user, :only => :destroy
  before_filter :require_admin_or_owner, :only => :destroy

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

private
  def collection
    @collection ||= end_of_association_chain.sort_by_name.get
  end

  def require_admin_or_owner
    forbid unless current_user.admin? or current_user == object.user
  end
end
