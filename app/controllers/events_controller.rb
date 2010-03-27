class EventsController < ResourceController::Base
  actions :all

  before_filter :require_person, :except => [:show, :index]
  before_filter :require_manager, :except => [:show, :index]

  create.success.wants.html { redirect_to events_url }
  show.before do
    if current_user
      @event_volunteer = object.event_volunteers.find_by_user_id(current_user.id)
    end
    event_user = current_user || User.new
    @event_volunteer ||= EventVolunteer.new(:user => event_user)
  end

	index.before do
		@newsitems = NewsItem.find(:all);
	end
end
