class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_url, :alert => exception.message
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
