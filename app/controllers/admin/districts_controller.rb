class Admin::DistrictsController < ApplicationController
  before_filter :authenticate_user!
  # GET /admin/districts
  # GET /admin/districts.json
  def index
    @admin_districts = Admin::District.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_districts }
    end
  end

  # GET /admin/districts/1
  # GET /admin/districts/1.json
  def show
    @admin_district = Admin::District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_district }
    end
  end

  # GET /admin/districts/new
  # GET /admin/districts/new.json
  def new
    @admin_district = Admin::District.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_district }
    end
  end

  # GET /admin/districts/1/edit
  def edit
    @admin_district = Admin::District.find(params[:id])
  end

  # POST /admin/districts
  # POST /admin/districts.json
  def create
    @admin_district = Admin::District.new(params[:admin_district])

    respond_to do |format|
      if @admin_district.save
        format.html { redirect_to @admin_district, notice: 'District was successfully created.' }
        format.json { render json: @admin_district, status: :created, location: @admin_district }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/districts/1
  # PUT /admin/districts/1.json
  def update
    @admin_district = Admin::District.find(params[:id])

    respond_to do |format|
      if @admin_district.update_attributes(params[:admin_district])
        format.html { redirect_to @admin_district, notice: 'District was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/districts/1
  # DELETE /admin/districts/1.json
  def destroy
    @admin_district = Admin::District.find(params[:id])
    @admin_district.destroy

    respond_to do |format|
      format.html { redirect_to admin_districts_url }
      format.json { head :no_content }
    end
  end
end
