class MobileUsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		@mobile_users = MobileUser.all
	end

	def new
		@mobile_user = MobileUser.new
	end

	def create
		@mobile_user = MobileUser.new(params[:mobile_user])
        #raise @mobile_user.inspect
		if @mobile_user.save
			#raise @mobile_user.imei.inspect
			flash[:notice] = "Mobile User created successfully."
			redirect_to mobile_users_path
		else
			render :new
		end
	end 

	def edit
		@mobile_user = MobileUser.find(params[:id])
	end

	def update
		@mobile_user = MobileUser.find(params[:id])

		if @mobile_user.update_attributes(params[:mobile_user])
			flash[:notice] = "Mobile User updated"
			redirect_to mobile_users_path
		else
			render :new
		end
	end

	def destroy
		@mobile_user = MobileUser.find(params[:id])

		@mobile_user.destroy
		flash[:notice] = "Deleted successfully"
		redirect_to mobile_users_path
		
	end
end
