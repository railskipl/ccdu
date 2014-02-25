class MobileDevicesController < ApplicationController
   before_filter :authenticate_user!
   
   def index
   	@mobile_devices = current_user.mobile_devices
   end

   def new
   	@mobile_device = MobileDevice.new
   end

   def create
   	@mobile_device = MobileDevice.new(params[:mobile_device])

   	if @mobile_device.save
   		flash[:notice] = "Mobile Device Added Successfully."
   		redirect_to mobile_devices_path
   	else
   		render :new
   	end
   end

   def edit
   	@mobile_device = MobileDevice.find(params[:id])
   end

   def update
    @mobile_device = MobileDevice.find(params[:id])
    #raise @mobile_device.inspect
   	if @mobile_device.update_attributes(params[:mobile_device])
   		flash[:notice] = "Mobile Device Updated Successfully"
        redirect_to mobile_devices_path
    else
    	render :new
    end
   end

   def show
   	 @mobile_device = MobileDevice.find(params[:id])
   end

   def destroy
   	@mobile_device = MobileDevice.find(params[:id])
   	@mobile_device.destroy
   	flash[:notice] = "Deleted Successfully"
   	redirect_to mobile_devices_path 
   end
end
