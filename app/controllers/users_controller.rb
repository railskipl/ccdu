class UsersController < ApplicationController
	#skip_before_filter :require_no_authentication, :only => [:new, :create]
  before_filter :authenticate_user!
  def index
  	@users = User.with_role(:vendor)
    #raise @user.inspect
  end

  def new
  	@user = User.new
    @role = Role.find_by_name("vendor")
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


  def destroy
     @user = User.find(params[:id])
     @user.destroy


     respond_to do |format|
       format.html { redirect_to(users_path) }
       format.xml  { head :ok }
     end
  end
end
