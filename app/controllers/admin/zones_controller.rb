class Admin::ZonesController < ApplicationController
   before_filter :authenticate_user!
   load_and_authorize_resource
  layout 'admin'
  # GET /admin/zones
  # GET /admin/zones.json
  def index
    @admin_zones = Admin::Zone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_zones }
    end
  end

  # GET /admin/zones/1
  # GET /admin/zones/1.json
  def show
    @admin_zone = Admin::Zone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_zone }
    end
  end

  # GET /admin/zones/new
  # GET /admin/zones/new.json
  def new
    @admin_zone = Admin::Zone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_zone }
    end
  end

  # GET /admin/zones/1/edit
  def edit
    @admin_zone = Admin::Zone.find(params[:id])
  end

  # POST /admin/zones
  # POST /admin/zones.json
  def create
    @admin_zone = Admin::Zone.new(params[:admin_zone])

    respond_to do |format|
      if @admin_zone.save
        format.html { redirect_to admin_zones_url, notice: 'Zone was successfully created.' }
        format.json { render json: @admin_zone, status: :created, location: @admin_zone }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/zones/1
  # PUT /admin/zones/1.json
  def update
    @admin_zone = Admin::Zone.find(params[:id])

    respond_to do |format|
      if @admin_zone.update_attributes(params[:admin_zone])
        format.html { redirect_to admin_zones_url, notice: 'Zone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/zones/1
  # DELETE /admin/zones/1.json
  def destroy
    @admin_zone = Admin::Zone.find(params[:id])
    @admin_zone.destroy

    respond_to do |format|
      format.html { redirect_to admin_zones_url }
      format.json { head :no_content }
    end
  end

  
     


end
