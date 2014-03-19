class InvoicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  require 'will_paginate/array'
  
  def index
    @invoice = current_user.invoices.where('is_invoice = ? and is_dist_invoice = ?', 0, 0).find(:all, :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "invoices"
      end
    end
  end

  def submit_invoice
    @invoice = Invoice.find(params[:id])
    @invoice.update_column(:is_invoice, 1)
    redirect_to :back
  end
  
  def payment
    @invoice = current_user.invoices.where('is_invoice = ? and is_dist_invoice = ?', 1, 1).find(:all, :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "district_invoice"
      end
    end
  end
  
  def outstanding
    @invoice = current_user.invoices.where('is_invoice = ? and is_dist_invoice = ?', 1, 0).find(:all, :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "district_invoice"
      end
    end
  end

  def district_invoice
    @invoice = Invoice.where('district_name = ? and is_invoice = ?',current_user.district_name, 1)
    @invoices = @invoice.find(:all ,:order=>"id desc").paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "district_invoice"
      end
    end
  end

  def zone_invoice
    #@invoice = Invoice.find_all_by_zone_name(current_user.zone_name,:conditions=>"is_invoice = 1", :order=>"id desc")
    @invoice = Invoice.where('zone_name = ?',current_user.zone_name)

    @invoices = @invoice.find(:all,:conditions=>"is_invoice = 1", :order=>"id desc").paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "zone_invoice"
      end
    end
  end

  def approve_invoice
    @invoice = Invoice.find(params[:id])
    
    if params[:accept] == "Accept"
      @invoice.update_column(:is_dist_invoice , 1)
    else 
    
    end
     redirect_to :back
  end

  def reject_invoice
    @invoice = Invoice.find(params[:id])
  end

  def remarks_for_rejection
    @invoice = Invoice.find(params[:id])
    if @invoice.update_attributes(params[:invoice])
    else
      render 'reject'
    end
  end

  def sample_code_count
    if params[:survey_ids].present?
      @survey_invoices = params[:survey_ids] rescue nil
      
      u = @survey_invoices.count rescue nil
      @survey_invoices.each do |survey|
         @survey_reports = SurveyReport.find_by_id(survey)
         @survey_reports.update_column(:is_invoiced , 1)
      end
      if params[:subaction] == "update"
        redirect_to new_invoice_path(:count => u , :survey_invoices => params[:survey_ids] )
        
      else
        redirect_to edit_invoice_path(params[:id], :survey_invoices => params[:survey_ids], :count => u ,:subaction => "edit")
      end
    else
      flash[:alert] = "Sample cannot be blank !"
      redirect_to :back 
    end
  end

  
  def new
    #raise params[:survey_invoices].inspect
    @invoice = Invoice.new
    
    if params[:subaction] == "update"

      start_from = params[:start_date] rescue ""
      start_to   = params[:end_date] rescue ""
      #raise start_to.inspect
      if start_from > start_to
        flash.now[:alert] = "Start date cannot be greater than end date !"
        
      else start_from <= start_to

       if start_from.blank?
         flash.now[:alert] = "Start date cannot be blank !"
  
       else
        #raise current_user.survey_reports.inspect
        @survey_reports = current_user.survey_reports.where('created_at >= ? and Date(created_at) <= ?',start_from, start_to).find(:all, :select => 'id ,water_source_code', :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc") 
        #raise @survey_reports.inspect
        
       end
      end
     
    end
    @survey_reports = current_user.survey_reports.find(:all, :select => 'id ,water_source_code', :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end
  
  def create
    
    #raise params.inspect
    if params[:invoice][:invoice_date].to_date <= Time.now.to_date

      @invoice = Invoice.new(params[:invoice])
      
      @district = Admin::District.find_by_district_name( @invoice.district_name)
      @zone = Admin::Zone.find(@district.zone_id)
      @invoice.zone_name =  @zone.zone_name
      #raise params.inspect

      respond_to do |format|
        if @invoice.save
           @a = params[:a]
           @a.each do |a|
             @survey_report = SurveyReport.find_by_id(a)
             @survey_report.update_column(:invoice_id, @invoice.id) 
           end
          format.html { redirect_to invoices_url, notice: 'Invoice generated successfully.' }
          format.json { render json: @invoice, status: :created, location: @invoice }
        else
          format.html { render action: "new" }
          format.json { render json: @invoice.errors, status: :unprocessable_entity }
        end
      end
    
      else
        redirect_to new_invoice_path, notice: 'Invoice date can not be greater than current date.'
      end
  end

  def edit
    @invoice = Invoice.find(params[:id])
    
    if params[:subaction] == "update"

      start_from = params[:start_date] rescue ""
      start_to   = params[:end_date] rescue ""
      #raise start_to.inspect
      if start_from > start_to
        flash[:notice] = "Start date cannot be greater than end date !"
    
      else start_from <= start_to

        if start_from.blank?
          flash[:notice] = "Start date cannot be blank !"
        
        else
          #raise current_user.survey_reports.inspect
           @survey_reports = current_user.survey_reports.where('created_at >= ? and Date(created_at) <= ? and is_invoiced = ? ',start_from, start_to,0).find(:all, :select => 'id ,water_source_code', :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc") 
            #raise @survey_reports.blank?.inspect
           if @survey_reports.blank?
            flash[:notice] = "No sample records found."
            redirect_to :back
           else
           end
           #@survey_reportss = current_user.survey_reports.where('invoice_id = ? and is_invoiced = ?', @invoice.id, 1 ).find(:all, :select => 'id ,water_source_code', :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
         # raise @survey_reportss.inspect
         
        end
      end
    else
     @survey_reports = current_user.survey_reports.where('is_invoiced = ?', 0 ).find(:all, :select => 'id ,water_source_code', :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
     
     #@survey_reportss = current_user.survey_reports.where('invoice_id = ? and is_invoiced = ?', @invoice.id, 1 ).find(:all, :select => 'id ,water_source_code,is_invoiced', :conditions=>"is_tested = 1 and is_dist_approved=1", :order=>"id desc")
    end
  end

  def update

    @invoice = Invoice.find(params[:id])
    if @invoice.update_attributes(params[:invoice])
      @a = params[:a]
      if @a.present?
       @a.each do |a|
          @survey_report = SurveyReport.find_by_id(a)
          #raise @survey_report.inspect
          @survey_report.update_column(:invoice_id, @invoice.id) 
        end
      else
        #raise "bye"
        
      end
      flash[:notice] = "Updated successfully !"
      redirect_to invoices_path
    else
      #raise "hello"
      render :new
    end
  end
end
