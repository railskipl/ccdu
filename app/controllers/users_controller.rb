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
    #@district = Admin::District.find_by_district_name(current_user.district_name)
    #@blocks = Admin::Block.where('district_id = ?', @district.id).find(:all, :select => 'id,block_name')
  end
  #update block manager id and transfer the mobile surveyor 
  #update block manager id and transfer the mobile surveyor 
  def update_manager
    @user = User.find(params[:id])
    #raise @user.inspect
    @user.update_attributes(:block_manager_id => params[:user][:block_manager_id], :is_transfer => true, :old_manager_id => current_user.id)
    @user.save
    redirect_to users_path, notice: 'Mobile surveyor was successfully transferred.'
  end

  def accept_user
    @user = User.find(params[:id])
    @user.update_attributes( :is_transfer => false, :old_manager_id => nil)
    @user.save
    redirect_to users_path, notice: 'Mobile surveyor added.'
  end

  def reject_user
    @user = User.find(params[:id])


    @user.update_attributes(:block_manager_id => @user.old_manager_id, :is_transfer => false, :old_manager_id => nil)
    @user.save
    redirect_to users_path, notice: 'Mobile surveyor rejected.'
    
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
