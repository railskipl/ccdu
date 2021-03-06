class SurveyReportsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  require 'will_paginate/array'
  
  # GET /survey_reports
  # GET /survey_reports.json
  def index
    
    # @survey_report = SurveyReport.find(:all, :conditions=>"actions != 1", :order=>"id desc")
    # @survey_reports = @survey_report.paginate(page: params[:page], per_page: 20)
    #raise params.inspect
    if params[:subaction] == "update"
      
      start_from = params[:survey][:start_date] rescue ""
      start_to   =   params[:survey][:end_date] rescue ""
      source_name = params[:survey][:source_name_eq] rescue ""
      water_source_type = params[:survey][:water_source_type_eq] rescue ""
      habitation = params[:survey][:habitation_eq] rescue ""
      
        if start_from > start_to 
         flash[:notice] = "Start date cannot be greater than end date"
         @survey_report = current_user.survey_reports.find(:all, :order=>"id desc")
         @survey_reports = @survey_report.paginate(page: params[:page], per_page: 20) 
        elsif start_from <= start_to

          if start_from.blank?
            @survey_report = current_user.survey_reports.where("source_name = ? or water_source_type = ? or habitation = ?", source_name,water_source_type,habitation)
            @survey_reports = @survey_report.find(:all, :order=>"id desc").paginate(page: params[:page], per_page: 20) 
          else
            @survey_report = current_user.survey_reports.where("created_at >= ? and Date(created_at) <= ?", start_from,start_to)
            @survey_reports = @survey_report.find(:all,:order=>"id desc").paginate(page: params[:page], per_page: 20)
          end
        else
          @survey_report = current_user.survey_reports.where("created_at >= ? and Date(created_at) <= ? and source_name = ? and water_source_type = ? and habitation = ?",start_from,start_to, source_name,water_source_type,habitation)
          @survey_reports = @survey_report.find(:all,:order=>"id desc").paginate(page: params[:page], per_page: 20) 
        end
    else
        
        @survey_report = current_user.survey_reports.find(:all,:order=>"id desc")
        @survey_reports = @survey_report.paginate(page: params[:page], per_page: 20)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "survey_reports"
      end
    end
  end


  # GET /survey_reports/1
  # GET /survey_reports/1.json
  def show
    @survey_report = SurveyReport.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey_report }
    end
  end

  # GET /survey_reports/new
  # GET /survey_reports/new.json
  def new
    @survey_report = SurveyReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey_report }
    end
  end

  # GET /survey_reports/1/edit
  def edit
    @survey_report = SurveyReport.find(params[:id])
  end

  # POST /survey_reports
  # POST /survey_reports.json
  def create
    #raise params.inspect
    location = params["location"].split("%")
    @code = params[:WaterSourceCode].split("/")
    @code1 = @code[3].split("-")
    @village = Admin::Village.where('village_name = ? ' , @code1[0])
    @grampanchayat = Admin::Grampanchyat.where('gram_name = ?', @code1[0])
    @habitation = Admin::Habitation.where('habitation_name =  ?', @code1[1] )
    
    unless @grampanchayat.present? or @village.present? and @habitation.present?
      @status = 1
    else 
      @status = 0
    end
    #raise @status.inspect
    @surveyor = User.find_by_block_manager_id(params[:CurrentUserId])
    #this @surveyor used to store name of mobile surveyor
    @user  = User.find(params[:CurrentUserId]) 
    #this @user used to find district name from block manager 
    @district = Admin::District.find_by_district_name(@user.district_name)
    # we will use @user for finding district example "JODHPUR,zone_id = 1"
    @zone = Admin::Zone.find(@district.zone_id)
    #And last we will find zone name with the help of @district credentials
    @survey_report = SurveyReport.create(
      :latitude => location[0],
      :longitude => location[1],
      :image=> params[:Image1],
      :image1=> params[:Image2],
      :source_name=> params[:WaterCode],
      :water_source_type=> params[:WaterSourceType],
      :source_location=> params[:NearestSourceLocation],
      :district_name => params[:District],
      :block_name => params[:Block],
      :grampanchayat => params[:GramPanchyat],
      :village => params[:Village],
      :survey_no => params[:SurveyNo],
      :remarks => params[:Remark],
      :water_source_code => params[:WaterSourceCode],
      :user_id => params[:CurrentUserId],
      :surveyor_name => @surveyor.user_fullname,
      :zone_name => @zone.zone_name,
      :district_level_status => @status

    )
    @surveycode = @survey_report.water_source_code
    #render water source code to json 
    render :status =>200,:json => @surveycode.to_json 
  end

  # PUT /survey_reports/1
  # PUT /survey_reports/1.json
  def update
    #raise params.inspect
    @survey_report = SurveyReport.find(params[:id])
    
    respond_to do |format|
      if @survey_report.update_attributes(params[:survey_report])

          #raise params[:survey_report][:source_location].inspect
          @code = @survey_report[:water_source_code].split("/")
          @code1 = @code[3].split("-")
          @village = Admin::Village.where('village_name = ? ' , @code1[0])
          @grampanchayat = Admin::Grampanchyat.where('gram_name = ?', @code1[0])
          @habitation = Admin::Habitation.where('habitation_name =  ?', @code1[1] )
          #raise @habitation.inspect

          if ((@grampanchayat.present? or @village.present?) and @habitation.present?)
             @survey_report.update_column(:district_level_status, 0)
          else 
              @survey_report.update_column(:district_level_status, 1)   
          end

        format.html { redirect_to @survey_report, notice: 'Survey report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey_report.errors, status: :unprocessable_entity }
      end
    end


  end
  
  
  def accept
    @survey_report = SurveyReport.find(params[:id])
    @survey_report.actions = 1
    @survey_report.save!
    respond_with(@survey_report, location: survey_reports_path)
  end
  
  def reject
   @survey_report = SurveyReport.find(params[:id])
  end

  def reason_for_reject
    #raise params.inspect
    @survey_report = SurveyReport.find(params[:id])
    if @survey_report.update_attributes(params[:survey_report])
      #respond_with(@survey_report, location: survey_reports_path)
    else
      render 'reject'
    end

  end
  
  

  # DELETE /survey_reports/1
  # DELETE /survey_reports/1.json
  def destroy
    @survey_report = SurveyReport.find(params[:id])
    @survey_report.destroy

    respond_to do |format|
      format.html { redirect_to survey_reports_url }
      format.json { head :no_content }
    end
  end
end

