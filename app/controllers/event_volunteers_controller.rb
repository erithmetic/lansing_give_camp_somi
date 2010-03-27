class EventVolunteersController < ResourceController::Base
  actions :create, :destroy
  belongs_to :event

  before_filter :require_admin_or_owner, :only => :destroy

  create do
    before do
      object.user = current_user
    end
    success.wants.html { redirect_to root_url }
  end
  destroy.wants.html { redirect_to root_url }

private
  def require_admin_or_owner
    return false unless current_user
    return false unless current_user.admin? or current_user == object.user
  end
end
