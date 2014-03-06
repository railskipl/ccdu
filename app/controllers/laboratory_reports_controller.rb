class LaboratoryReportsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  require 'will_paginate/array'
  
  def index
    #raise params.inspect
    
    #raise (start_from != nil || start_to != nil).inspect
      if params[:subaction] == "update"
        @start_from = params[:start_date] rescue ""
        @start_to   = params[:end_date] rescue ""
        source_name = params[:source_name][:source_name_eq] rescue ""
        water_source_type = params[:water_source_type][:water_source_type_eq] rescue ""
        habitation = params[:habitation][:habitation_eq] rescue ""
        
        if start_from > start_to 
         flash[:notice] = "Start date cannot be greater than end date"
         @survey_report = current_user.survey_reports.find(:all, :conditions=>"actions = 1", :order=>"id desc")
         @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10) 
        elsif start_from <= start_to

          if start_from.blank?
            @survey_report = current_user.survey_reports.where("source_name = ? or water_source_type = ? or habitation = ?", source_name,water_source_type,habitation)
            @survey_reports = @survey_report.find(:all,:conditions=>"actions = 1", :order=>"id desc").paginate(page: params[:page], per_page: 10) 
          else
            @survey_report = current_user.survey_reports.where("created_at >= ? and Date(created_at) <= ?", @start_from,@start_to)
            @survey_reports = @survey_report.find(:all,:conditions=>"actions = 1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
          end
        else
          @survey_report = @survey_report = current_user.survey_reports.where("created_at >= ? and Date(created_at) <= ? and source_name = ? and water_source_type = ? and habitation = ?",@start_from,@start_to, source_name,water_source_type,habitation)
          @survey_reports = @survey_report.find(:all,:conditions=>"actions = 1", :order=>"id desc").paginate(page: params[:page], per_page: 10) 
        end
      else

        @survey_report = current_user.survey_reports.find(:all, :conditions=>"actions = 1", :order=>"id desc")
        @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
      end
      

    
    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "survey_reports"
      end
    end
  end
  
  def district

    if params[:subaction] == "update"
        start_from = params[:start_date] rescue ""
        start_to   = params[:end_date] rescue ""
        block_name = params[:block_name][:block_name_eq] rescue ""
        
        if start_from > start_to 
         flash[:notice] = "Start date cannot be greater than end date"

         @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=0", :order=>"id desc")
         @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
        else start_from <= start_to

          if start_from.blank?
            @user = User.find_by_block_name(block_name)
            @survey_reports = SurveyReport.find_all_by_user_id(@user, :conditions=>"is_tested = 1 and is_dist_approved=0", :order=>"id desc").paginate(page: params[:page], per_page: 10)
            #@survey_reports = @survey_report.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
           
          else
            @survey_report = SurveyReport.where("created_at >= ? and Date(created_at) <= ?", start_from,start_to)
            @survey_reports = @survey_report.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=0", :order=>"id desc").paginate(page: params[:page], per_page: 10)
            
          end
        end
      else

        @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=0", :order=>"id desc")
        @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
      end

      respond_to do |format|
        format.html # index.html.erb
        format.xls
        format.pdf do
           render :pdf => "survey_reports"
        end
      end
    # @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=0", :order=>"id desc")
    # @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
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

  def district_accept
      
      if params[:subaction] == "update"
        start_from = params[:start_date] rescue ""
        start_to   = params[:end_date] rescue ""
        block_name = params[:block_name][:block_name_eq] rescue ""
        
        if start_from > start_to 
         flash[:notice] = "Start date cannot be greater than end date"

         @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
         @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
        else start_from <= start_to

          if start_from.blank?
            @user = User.find_by_block_name(block_name)
            @survey_reports = SurveyReport.find_all_by_user_id(@user, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
            #@survey_reports = @survey_report.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
           
          else
            @survey_report = SurveyReport.where("created_at >= ? and Date(created_at) <= ?", start_from,start_to)
            @survey_reports = @survey_report.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
            
          end
        end
      else

        @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
        @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
      end
    #   @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
    #   @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "survey_reports"
      end
    end
  end

  def district_reject
    
    if params[:subaction] == "update"
        start_from = params[:start_date] rescue ""
        start_to   = params[:end_date] rescue ""
        block_name = params[:block_name][:block_name_eq] rescue ""
        
        if start_from > start_to 
         flash[:notice] = "Start date cannot be greater than end date"

         @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
         @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
        else start_from <= start_to

          if start_from.blank?
            @user = User.find_by_block_name(block_name)
            @survey_reports = SurveyReport.find_all_by_user_id(@user, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc").paginate(page: params[:page], per_page: 10)
            #@survey_reports = @survey_report.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
           
          else
            @survey_report = SurveyReport.where("created_at >= ? and Date(created_at) <= ?", start_from,start_to)
            @survey_reports = @survey_report.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc").paginate(page: params[:page], per_page: 10)
            
          end
        end
      else

        @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
        @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
      end

    # @survey_report = SurveyReport.find_all_by_districtname(current_user.district_name, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
    # @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "survey_reports"
      end
    end
  end 
  
  def accepted_sample
     
      if params[:subaction] == "update"
        start_from = params[:start_date] rescue ""
        start_to   = params[:end_date] rescue ""
        
        if start_from > start_to 
         flash[:notice] = "Start date cannot be greater than end date"
         @survey_report = current_user.survey_reports.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
         @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
        else start_from <= start_to

          if start_from.blank?
            @survey_report = current_user.survey_reports.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
            @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
          else
            @survey_report = current_user.survey_reports.where("created_at >= ? and Date(created_at) <= ?", start_from,start_to)
            @survey_reports = @survey_report.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
          end
        end
      else

        @survey_report = current_user.survey_reports.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
        @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
      end

      respond_to do |format|
        format.html # index.html.erb
        format.xls
        format.pdf do
           render :pdf => "survey_reports"
        end
      end
     
     # @survey_report = SurveyReport.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
     # @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
  end
  
  def rejected_sample

    if params[:subaction] == "update"
        start_from = params[:start_date] rescue ""
        start_to   = params[:end_date] rescue ""
        
        if start_from > start_to 
         flash[:notice] = "Start date cannot be greater than end date"
         @survey_report = current_user.survey_reports.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
         @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
        else start_from <= start_to

          if start_from.blank?
            flash[:notice] = "Start date can not be blank."
            @survey_report = current_user.survey_reports.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
            @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
          else
            @survey_report = current_user.survey_reports.where("created_at >= ? and Date(created_at) <= ?", start_from,start_to)
            @survey_reports = @survey_report.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc").paginate(page: params[:page], per_page: 10)
          end
        end
      else
        @survey_report = current_user.survey_reports.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
        @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
      end

      respond_to do |format|
        format.html # index.html.erb
        format.xls
        format.pdf do
           render :pdf => "survey_reports"
        end
      end
    # @survey_report = SurveyReport.find(:all, :conditions=>"is_tested = 1 and is_dist_approved=2", :order=>"id desc")
    # @survey_reports = @survey_report.paginate(page: params[:page], per_page: 10)
  end

  def update_testing_report
    @survey_report = SurveyReport.find(params[:id])
  end

  def submit_update_test
    @survey_report = SurveyReport.find(params[:id])
    if @survey_report.update_attributes(params[:survey_report])
      #respond_with(@survey_report, location: rejected_sample_laboratory_reports_path)
    else
      render 'update_testing_report'
    end
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
