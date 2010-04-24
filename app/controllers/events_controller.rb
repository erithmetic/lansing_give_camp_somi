class EventsController < ResourceController::Base
  actions :all

  before_filter :require_user, :except => [:show, :index]
  before_filter :require_admin, :except => [:show, :index]

  index.before do
    @newsitems = NewsItem.find(:all);
    @fundraisings = FundRaising.find(:all);
  end

  create.success.wants.html { redirect_to events_url }

  show.before do
    if current_user
      @event_volunteer = object.event_volunteers.find_by_user_id(current_user.id)
    end
    event_user = current_user || User.new
    @event_volunteer ||= EventVolunteer.new(:user => event_user)
  end

  destroy.wants.html { redirect_to user_path(current_user) }

private
  def collection
    Event.upcoming
  end
end
