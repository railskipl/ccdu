class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_url, :alert => exception.message
	end

  before_filter :zone


  private
  def zone
    zone = Admin::Zone.find_by_zone_name(current_user.zone_name) 
    @districts = Admin::District.find_all_by_zone_id(zone.id)
  end

    def after_sign_in_path_for(resource)
    	#raise resource.has_role?(:admin).inspect
	  if resource.has_role?(:admin)
	    admin_root_path
	  else
	    root_path
	  end
    end
end
