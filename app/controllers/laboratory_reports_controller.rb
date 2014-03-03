class LaboratoryReportsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  
  def index
    @survey_reports = SurveyReport.find(:all, :conditions=>"actions = 1", :order=>"id desc")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "survey_reports"
      end
    end
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
      respond_with(@survey_report, location: survey_reports_path)
    else
      render 'send_for_testing'
    end
  end
  
  
end
