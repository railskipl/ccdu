class UsersController < ApplicationController
	#skip_before_filter :require_no_authentication, :only => [:new, :create]
  before_filter :authenticate_user!
  def index
  	@users = User.with_role(:mobile)
    #raise @user.inspect
  end

  def new
  	@user = User.new
    @role = Role.find_by_name("mobile")
  end

  def create
     @user = User.new(params[:user])

     respond_to do |format|
       if @user.save
         
         format.html { redirect_to users_path, notice: 'User was successfully created.' }
       else
         format.html { render :action => "new" }
       end
     end
  end

  def edit
     @user = User.find(params[:id])
     @role = Role.find_by_name("mobile")
  end

  def update
   @user = User.find(params[:id])

   respond_to do |format|
     if @user.update_attributes(params[:user])
       format.html { redirect_to users_path, notice: 'User was successfully updated.' }
     else
       format.html { render :action => "edit" }
     end
   end
  end

  # find user, for changing block manager id
  def edit_manager 
    @user = User.find(params[:id])
  end
  #update block manager id and transfer the mobile surveyor 
  def update_manager
    @user = User.find(params[:id])
    @user.update_column(:block_manager_id, params[:user][:block_manager_id])
    redirect_to users_path, notice: 'Manager was successfully transferred.'
  end



  def destroy
     @user = User.find(params[:id])
     @user.destroy


     respond_to do |format|
       format.html { redirect_to(users_path) }
       format.xml  { head :ok }
     end
  end
end
