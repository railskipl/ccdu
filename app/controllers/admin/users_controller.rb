class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  layout 'admin'
  def index
  	@users = User.all
    #raise @user.inspect
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
  	@user = User.new
  end

  def create
     
     @user = User.new(params[:user])

     respond_to do |format|
       if @user.save
         
         format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
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
         format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
       else
         format.html { render :action => "edit" }
       end
     end
  end

  def destroy
     @user = User.find(params[:id])

     @user.destroy


     respond_to do |format|
       format.html { redirect_to(admin_users_path) }
       format.xml  { head :ok }
     end
  end
end
