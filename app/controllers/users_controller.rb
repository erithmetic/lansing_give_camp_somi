class UsersController < ResourceController::Base
  actions :all

	# GET /users/1/dashboard
	# GET /users/1/dashboard.xml
	def dashboard
    @user = User.find(params[:id])
		@other_upcoming = Event.upcoming - @user.events.upcoming

		if @user.admin?
			render :action => 'admin_dashboard' 
		else
    	respond_to do |format|
      	format.html # dashboard.html.erb
      	format.xml  { render :xml => @user }
    	end
		end
	end

	# GET /users/1/admin_dashboard
	# GET /users/1/admin_dashboard.xml
	def admin_dashboard
    @user = User.find(params[:id])
		@other_upcoming = Event.upcoming

		if not @user.admin?
			render :action => 'dashboard' 
		else
    	respond_to do |format|
      	format.html # admin_dashboard.html.erb
      	format.xml  { render :xml => @user }
    	end
		end
	end
end
