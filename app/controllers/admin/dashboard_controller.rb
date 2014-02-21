class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
 
  layout 'admin'
	def index
		
	end
 #   private
	# def verify_is_admin
 #            (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.has_role? :admin?)
 #            flash[:notice] = "Access Denied"
 #        end
end
