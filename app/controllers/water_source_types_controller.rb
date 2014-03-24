class WaterSourceTypesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  layout 'admin'

  def index
  	@water_source_types = WaterSourceType.all
  end

  def new
  	@water_source_type = WaterSourceType.new
  end

  def create
  	@water_source_type = WaterSourceType.new(params[:water_source_type])

  	if @water_source_type.save
  		flash[:notice] = "Water source type added successfully."
  		redirect_to water_source_types_path
  	else
  		render :new
  	end
  end

  def edit
  	@water_source_type = WaterSourceType.find(params[:id])
  end

  def update

  	@water_source_type = WaterSourceType.find(params[:id])
    #raise @water_source_type.inspect
  	if @water_source_type.update_attributes(params[:water_source_type])
  		flash[:notice] = "Water source updated successfully ."
  		redirect_to water_source_types_path
  	else
  		render :new
  	end
  end
end
