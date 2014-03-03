class SurveyReportsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  require 'will_paginate/array'
  # GET /survey_reports
  # GET /survey_reports.json
  def index
    @survey_report = SurveyReport.find(:all, :conditions=>"actions != 1", :order=>"id desc")
    @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
    
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
    #raise location.inspect
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
      :water_source_code => params[:WaterSourceCode]

    )
    @surveycode = @survey_report.water_source_code
    #render water source code to json 
    render :status =>200,:json => @surveycode.to_json 
  end

  # PUT /survey_reports/1
  # PUT /survey_reports/1.json
  def update
    @survey_report = SurveyReport.find(params[:id])

    respond_to do |format|
      if @survey_report.update_attributes(params[:survey_report])
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
    #raise "hi"
  end

  def reason_for_reject
    #raise params.inspect
    @survey_report = SurveyReport.find(params[:id])
    if @survey_report.update_attributes(params[:survey_report])
      respond_with(@survey_report, location: survey_reports_path)
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
