class SessionsController < Devise::SessionsController
   layout 'devise'
    def new
      super
    end

	def create
		self.resource = warden.authenticate!(auth_options)
		if resource.has_role?(:mobile)
			sign_out current_user
			redirect_to root_url,:notice => "Access Denied"
		else
		    set_flash_message(:notice, :signed_in) if is_navigational_format?
		    sign_in(resource_name, resource)
			    if !session[:return_to].blank?
			      redirect_to session[:return_to]
			      session[:return_to] = nil
			    else
			      respond_with resource, :location => after_sign_in_path_for(resource)
			    end
	    end
    end   

	def destroy
      sign_out
      redirect_to root_path
    end
end
