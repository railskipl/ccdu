class InvoicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  respond_to :html, :js, :json
  require 'will_paginate/array'
  
  def index
    @invoice = Invoice.find(:all, :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)
  end
  
  def payment
    @invoice = Invoice.find(:all, :conditions=>"is_invoice = 1", :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)
  end
  
  def outstanding
    @invoice = Invoice.find(:all, :conditions=>"is_invoice = 0", :order=>"id desc")
    @invoices = @invoice.paginate(page: params[:page], per_page: 10)
  end
  
  
  def new
    @invoice = Invoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end
  
  def create
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
  end
  
  
end
