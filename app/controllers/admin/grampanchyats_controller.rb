class Admin::GrampanchyatsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  layout 'admin'
  # GET /admin/grampanchyats
  # GET /admin/grampanchyats.json
  def index
    @admin_grampanchyats = Admin::Grampanchyat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_grampanchyats }
    end
  end

  # GET /admin/grampanchyats/1
  # GET /admin/grampanchyats/1.json
  def show
    @admin_grampanchyat = Admin::Grampanchyat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_grampanchyat }
    end
  end

  # GET /admin/grampanchyats/new
  # GET /admin/grampanchyats/new.json
  def new
    @admin_grampanchyat = Admin::Grampanchyat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_grampanchyat }
    end
  end

  # GET /admin/grampanchyats/1/edit
  def edit
    @admin_grampanchyat = Admin::Grampanchyat.find(params[:id])
  end

  # POST /admin/grampanchyats
  # POST /admin/grampanchyats.json
  def create
    @admin_grampanchyat = Admin::Grampanchyat.new(params[:admin_grampanchyat])

    respond_to do |format|
      if @admin_grampanchyat.save
        format.html { redirect_to @admin_grampanchyat, notice: 'Grampanchyat was successfully created.' }
        format.json { render json: @admin_grampanchyat, status: :created, location: @admin_grampanchyat }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_grampanchyat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/grampanchyats/1
  # PUT /admin/grampanchyats/1.json
  def update
    @admin_grampanchyat = Admin::Grampanchyat.find(params[:id])

    respond_to do |format|
      if @admin_grampanchyat.update_attributes(params[:admin_grampanchyat])
        format.html { redirect_to @admin_grampanchyat, notice: 'Grampanchyat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_grampanchyat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/grampanchyats/1
  # DELETE /admin/grampanchyats/1.json
  def destroy
    @admin_grampanchyat = Admin::Grampanchyat.find(params[:id])
    @admin_grampanchyat.destroy

    respond_to do |format|
      format.html { redirect_to admin_grampanchyats_url }
      format.json { head :no_content }
    end
  end
end
