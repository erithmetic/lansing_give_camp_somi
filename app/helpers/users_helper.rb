module UsersHelper
	def admin_checkbox(user, user_form)
		if user.nil?
			return
		end
		
		if user.admin && user.admin?
			return "<p>#{user_form.label :admin, "Make Admin", :class=>"standard" }<br />
						#{ user_form.check_box :admin }</p>"
		end
	end

end
