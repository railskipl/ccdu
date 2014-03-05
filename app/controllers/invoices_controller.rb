class InvoicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  require 'will_paginate/array'
  
  def index
    @invoice = current_user.invoices.find(:all, :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "invoices"
      end
    end
  end
  
  def payment
    @invoice = current_user.invoices.find(:all, :conditions=>"is_invoice = 1", :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)
  end
  
  def outstanding
    @invoice = current_user.invoices.find(:all, :conditions=>"is_invoice = 0", :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)
  end

  def district_invoice
    @invoice = Invoice.find_all_by_district_name(current_user.district_name, :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "district_invoice"
      end
    end
  end

  def approve_invoice
    @invoice = Invoice.find(params[:id])
    @invoice.is_invoice = 1
    @invoice.save!
    redirect_to district_invoice_invoices_path
  end

  
  def new
    @invoice = Invoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end
  
  def create

    if params[:invoice][:invoice_date].to_date <= Time.now.to_date

      @invoice = Invoice.new(params[:invoice])
    
      respond_to do |format|
        if @invoice.save
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
  
  
end
