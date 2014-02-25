class Admin::SourcesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  layout 'admin'
  # GET /admin/sources
  # GET /admin/sources.json
  def index
    @admin_sources = Admin::Source.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_sources }
    end
  end

  # GET /admin/sources/1
  # GET /admin/sources/1.json
  def show
    @admin_source = Admin::Source.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_source }
    end
  end

  # GET /admin/sources/new
  # GET /admin/sources/new.json
  def new
    @admin_source = Admin::Source.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_source }
    end
  end

  # GET /admin/sources/1/edit
  def edit
    @admin_source = Admin::Source.find(params[:id])
  end

  # POST /admin/sources
  # POST /admin/sources.json
  def create
    @admin_source = Admin::Source.new(params[:admin_source])

    respond_to do |format|
      if @admin_source.save
        format.html { redirect_to admin_sources_url, notice: 'Source was successfully created.' }
        format.json { render json: admin_sources_url, status: :created, location: @admin_source }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/sources/1
  # PUT /admin/sources/1.json
  def update
    @admin_source = Admin::Source.find(params[:id])

    respond_to do |format|
      if @admin_source.update_attributes(params[:admin_source])
        format.html { redirect_to admin_sources_url, notice: 'Source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sources/1
  # DELETE /admin/sources/1.json
  def destroy
    @admin_source = Admin::Source.find(params[:id])
    @admin_source.destroy

    respond_to do |format|
      format.html { redirect_to admin_sources_url }
      format.json { head :no_content }
    end
  end
end
