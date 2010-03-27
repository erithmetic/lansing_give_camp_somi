class PasswordResetsController < ResourceController::Base
  actions :new_record, :create, :edit, :update

  create do
    success.wants.html { render :action => 'create' }
    failure.wants.html { render :action => 'new' }
  end
  update.success.wants.html { redirect_to root_url }
  update.after { login_user }

private
  def login_user
    UserSession.create!(object.user)
  end
end
