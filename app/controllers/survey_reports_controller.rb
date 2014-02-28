class SurveyReportsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :json
  # GET /survey_reports
  # GET /survey_reports.json
  def index
    @survey_reports = SurveyReport.all
    
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
    @survey_report = SurveyReport.create(
      :image=> params[:Image1],
      :image1=> params[:Image2],
      :source_name=> params[:WaterSourceCode],
      :water_source_type=> params[:WaterSourceType],
      :source_location=> params[:NearestSourceLocation])
    
    respond_to do |format|
      if @survey_report.save
        format.html { redirect_to survey_reports_url, notice: 'Survey report was successfully created.' }
        format.json { render :status =>200,:json => { :error => "valid" } }
      else
        format.html { render action: "new" }
        format.json { render json: @survey_report.errors, status: :unprocessable_entity }
      end
    end
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
