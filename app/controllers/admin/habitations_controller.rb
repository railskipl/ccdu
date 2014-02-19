class Admin::HabitationsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  # GET /admin/habitations
  # GET /admin/habitations.json
  def index
    @admin_habitations = Admin::Habitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_habitations }
    end
  end

  # GET /admin/habitations/1
  # GET /admin/habitations/1.json
  def show
    @admin_habitation = Admin::Habitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_habitation }
    end
  end

  # GET /admin/habitations/new
  # GET /admin/habitations/new.json
  def new
    @admin_habitation = Admin::Habitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_habitation }
    end
  end

  # GET /admin/habitations/1/edit
  def edit
    @admin_habitation = Admin::Habitation.find(params[:id])
  end

  # POST /admin/habitations
  # POST /admin/habitations.json
  def create
    @admin_habitation = Admin::Habitation.new(params[:admin_habitation])

    respond_to do |format|
      if @admin_habitation.save
        format.html { redirect_to @admin_habitation, notice: 'Habitation was successfully created.' }
        format.json { render json: @admin_habitation, status: :created, location: @admin_habitation }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_habitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/habitations/1
  # PUT /admin/habitations/1.json
  def update
    @admin_habitation = Admin::Habitation.find(params[:id])

    respond_to do |format|
      if @admin_habitation.update_attributes(params[:admin_habitation])
        format.html { redirect_to @admin_habitation, notice: 'Habitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_habitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/habitations/1
  # DELETE /admin/habitations/1.json
  def destroy
    @admin_habitation = Admin::Habitation.find(params[:id])
    @admin_habitation.destroy

    respond_to do |format|
      format.html { redirect_to admin_habitations_url }
      format.json { head :no_content }
    end
  end
end
