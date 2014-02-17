class Admin::VillagesController < ApplicationController
  # GET /admin/villages
  # GET /admin/villages.json
  def index
    @admin_villages = Admin::Village.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_villages }
    end
  end

  # GET /admin/villages/1
  # GET /admin/villages/1.json
  def show
    @admin_village = Admin::Village.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_village }
    end
  end

  # GET /admin/villages/new
  # GET /admin/villages/new.json
  def new
    @admin_village = Admin::Village.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_village }
    end
  end

  # GET /admin/villages/1/edit
  def edit
    @admin_village = Admin::Village.find(params[:id])
  end

  # POST /admin/villages
  # POST /admin/villages.json
  def create
    @admin_village = Admin::Village.new(params[:admin_village])

    respond_to do |format|
      if @admin_village.save
        format.html { redirect_to @admin_village, notice: 'Village was successfully created.' }
        format.json { render json: @admin_village, status: :created, location: @admin_village }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_village.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/villages/1
  # PUT /admin/villages/1.json
  def update
    @admin_village = Admin::Village.find(params[:id])

    respond_to do |format|
      if @admin_village.update_attributes(params[:admin_village])
        format.html { redirect_to @admin_village, notice: 'Village was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_village.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/villages/1
  # DELETE /admin/villages/1.json
  def destroy
    @admin_village = Admin::Village.find(params[:id])
    @admin_village.destroy

    respond_to do |format|
      format.html { redirect_to admin_villages_url }
      format.json { head :no_content }
    end
  end
end
