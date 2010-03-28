class UsersController < ResourceController::Base
  actions :all

	# GET /users/1/dashboard
	# GET /users/1/dashboard.xml
	def dashboard
    @user = User.find(params[:id])
		@other_upcoming = Event.upcoming - @user.events.upcoming
    respond_to do |format|
      format.html # dashboard.html.erb
      format.xml  { render :xml => @user }
    end
	end
end
