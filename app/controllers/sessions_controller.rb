class SessionsController < Devise::SessionsController
   after_filter :set_csrf_header, only: [:new, :create]
   skip_before_filter :verify_authenticity_token, :only => [:new, :create]
   respond_to :json
   layout 'devise'
    def new
      super
    end

	def create
		#raise params[:device].inspect
		if params[:device] == 'mobile' 
		
	        user = User.find_by_username(params[:username])
	        #raise user.inspect
			if user && user.valid_password?(params[:password])
		      set_flash_message(:notice, :signed_in) if is_navigational_format?
		      sign_in(:user, user)
		      @user = current_user.id
		      render :status =>200,:json => current_user.to_json
		    else
		      flash[:alert] = "Invalid password"
		      render :status =>401,:json => { :error => "Invalid" }
		    end

        else
			self.resource = warden.authenticate!(auth_options)
			#raise auth_options.inspect
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
    end   

	# def destroy
 #      sign_out
 #      redirect_to root_path
 #    end



    protected

	def set_csrf_header
	   response.headers['X-CSRF-Token'] = form_authenticity_token
	end
end
