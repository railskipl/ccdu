class LaboratoryReportsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  require 'will_paginate/array'
  
  def index
    @survey_report = SurveyReport.find(:all, :conditions=>"actions = 1", :order=>"id desc")
    @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "survey_reports"
      end
    end
  end
  
  def district
    @survey_report = SurveyReport.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=0", :order=>"id desc")
    @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
  end


 
  def show
    @survey_report = SurveyReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey_report }
    end
  end

 
  
  def send_for_testing
    @survey_report = SurveyReport.find(params[:id])
  end
  
  def submit_test
    @survey_report = SurveyReport.find(params[:id])
    if @survey_report.update_attributes(params[:survey_report])
      #respond_with(@survey_report, location: survey_reports_path)
    else
      render 'send_for_testing'
    end
  end
  
  def accept
    @survey_report = SurveyReport.find(params[:id])
    @survey_report.is_dist_approved = 1
    @survey_report.save!
    respond_with(@survey_report, location: survey_reports_path)
  end
  
  def reject
    @survey_report = SurveyReport.find(params[:id])
  end 
  
  def accepted_sample
     @survey_report = SurveyReport.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
     @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
  end
  
  def rejected_sample
    @survey_report = SurveyReport.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
    @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
  end
  
  
  def reason_for_reject
    
    @survey_report = SurveyReport.find(params[:id])
    if @survey_report.update_attributes(params[:survey_report])
      #respond_with(@survey_report, location: survey_reports_path)
    else
      render 'reject'
    end

  end
  
  
end
