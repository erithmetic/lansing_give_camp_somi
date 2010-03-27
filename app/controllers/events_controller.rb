class EventsController < ResourceController::Base
  actions :all

  create.success.wants.html { redirect_to events_url }
end
