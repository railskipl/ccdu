class MisReportsController < ApplicationController
    before_filter :authenticate_user!
    layout "admin", :only => [:admin_mis_report,:search_admin_mis_report]

   def block_mis_report
    #current day record(Accepted data)
    @survey_reports = current_user.survey_reports.where('Date(created_at) = ?', Date.today).find(:all,:select => 'id' , :conditions => 'actions = 1')
    @survey_reports_dist = current_user.survey_reports.where('Date(created_at) = ?', Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
    @invoice = current_user.invoices.where('Date(created_at) = ?', Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")

    #Current month to till date data.(Accepted data)
        @survey_reports1 = current_user.survey_reports.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist1 = current_user.survey_reports.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice1 = current_user.invoices.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
        
    #Total data, Till date from project live(Accepted data)
        @survey_reports2 = current_user.survey_reports.find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist2 = current_user.survey_reports.find(:all,:select => 'id', :conditions => 'actions = 1 and is_dist_approved = 1')
        @invoice2 = current_user.invoices.find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
        
        
        #########################################current day record(Rejected data) #############################################################
        @survey_reports_rej = current_user.survey_reports.where('Date(created_at) = ?', Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist_rej = current_user.survey_reports.where('Date(created_at) = ?', Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice_rej = current_user.invoices.where('Date(created_at) = ?', Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")
        
        #Current month to till date data.(Rejected data)
        @survey_reports1_rej = current_user.survey_reports.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist1_rej = current_user.survey_reports.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice1_rej = current_user.invoices.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")

    #Total data, Till date from project live(Rejected data)
        @survey_reports2_rej = current_user.survey_reports.find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist2_rej = current_user.survey_reports.find(:all,:select => 'id', :conditions => 'actions = 1 and is_dist_approved = 2')
        @invoice2_rej = current_user.invoices.find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")

   end

   def  search_block_mis_report
        
        if params[:start_date].blank?
                flash[:notice] = "Start date cannot be blank !"
                redirect_to :back
        elsif params[:start_date] > params[:end_date]
                flash[:notice] = "Start date cannot be greater than end date"
                redirect_to :back
        else  params[:start_date] <= params[:end_date]
                @search_dates = (params[:start_date]..params[:end_date])
        end
   end


   def district_mis_report

        #current day record(Accepted data)
        @survey_reports = SurveyReport.where('districtname = ? and Date(created_at) = ?',current_user.district_name, Date.today).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist = SurveyReport.where('districtname = ? and Date(created_at) = ?',current_user.district_name, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice = Invoice.where('district_name = ? and Date(created_at) = ?',current_user.district_name, Date.today).find(:all, :conditions=>"is_invoice = 1", :order=>"id desc")

        #Current month to till date data.(Accepted data)
        @survey_reports1 = SurveyReport.where('districtname = ? and created_at >= ? and Date(created_at) <= ?',current_user.district_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist1 = SurveyReport.where('districtname = ? and created_at >= ? and Date(created_at) <= ?',current_user.district_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice1 = Invoice.where('district_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.district_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
                
        #Total data, Till date from project live(Accepted data)
        @survey_reports2 = SurveyReport.where('districtname = ?', current_user.district_name).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist2 = SurveyReport.where('districtname = ?', current_user.district_name).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice2 = Invoice.where('district_name = ?', current_user.district_name).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
                
        
        #########################################current day record(Rejected data) #############################################################
        @survey_reports_rej = SurveyReport.where('districtname = ? and Date(created_at) = ?',current_user.district_name, Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist_rej = SurveyReport.where('districtname = ? and Date(created_at) = ?',current_user.district_name, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice_rej = Invoice.where('district_name = ? and Date(created_at) = ?',current_user.district_name, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")
                
        #Current month to till date data.(Rejected data)
        @survey_reports1_rej = SurveyReport.where('districtname = ? and created_at >= ? and Date(created_at) <= ?',current_user.district_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist1_rej = SurveyReport.where('districtname = ? and created_at >= ? and Date(created_at) <= ?',current_user.district_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice1_rej = Invoice.where('district_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.district_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")

        #Total data, Till date from project live(Rejected data)
        @survey_reports2_rej = SurveyReport.where('districtname = ?', current_user.district_name).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist2_rej =  SurveyReport.where('districtname = ?', current_user.district_name).find(:all,:select => 'id', :conditions => 'actions = 1 and is_dist_approved = 2')
        @invoice2_rej = Invoice.where('district_name = ?', current_user.district_name).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")

        layout "admin"
   end
   

   def  search_district_mis_report
        
        if params[:start_date].blank?
                flash[:notice] = "Start date cannot be blank !"
                redirect_to :back
        elsif params[:start_date] > params[:end_date]
                flash[:notice] = "Start date cannot be greater than end date"
                redirect_to :back
        else  params[:start_date] <= params[:end_date]
                @search_dates = (params[:start_date]..params[:end_date])
        end
   end


   def zone_mis_report
      #current day record(Accepted data)
        @survey_reports = SurveyReport.where('zone_name = ? and Date(created_at) = ?',current_user.zone_name, Date.today).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist = SurveyReport.where('zone_name = ? and Date(created_at) = ?',current_user.zone_name, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice = Invoice.where('zone_name = ? and Date(created_at) = ?',current_user.zone_name, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")

        #Current month to till date data.(Accepted data)
        @survey_reports1 = SurveyReport.where('zone_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.zone_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist1 = SurveyReport.where('zone_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.zone_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice1 = Invoice.where('zone_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.zone_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
                
        #Total data, Till date from project live(Accepted data)
        @survey_reports2 = SurveyReport.where('zone_name = ?', current_user.zone_name).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist2 = SurveyReport.where('zone_name = ?', current_user.zone_name).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice2 = Invoice.where('zone_name = ?', current_user.zone_name).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
                
        
        #########################################current day record(Rejected data) #############################################################
        @survey_reports_rej = SurveyReport.where('zone_name = ? and Date(created_at) = ?',current_user.zone_name, Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist_rej = SurveyReport.where('zone_name = ? and Date(created_at) = ?',current_user.zone_name, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice_rej = Invoice.where('zone_name = ? and Date(created_at) = ?',current_user.zone_name, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")
                
        #Current month to till date data.(Rejected data)
        @survey_reports1_rej = SurveyReport.where('zone_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.zone_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist1_rej = SurveyReport.where('zone_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.zone_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice1_rej = Invoice.where('zone_name = ? and created_at >= ? and Date(created_at) <= ?',current_user.zone_name, (Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")

        #Total data, Till date from project live(Rejected data)
        @survey_reports2_rej = SurveyReport.where('zone_name = ?', current_user.zone_name).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist2_rej =  SurveyReport.where('zone_name = ?', current_user.zone_name).find(:all, :conditions => 'actions = 1 and is_dist_approved = 2')
        @invoice2_rej = Invoice.where('zone_name = ?', current_user.zone_name).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")

        
   end

   def  search_zone_mis_report
        
        if params[:start_date].blank?
                flash[:notice] = "Start date cannot be blank !"
                redirect_to :back
        elsif params[:start_date] > params[:end_date]
                flash[:notice] = "Start date cannot be greater than end date"
                redirect_to :back
        else  params[:start_date] <= params[:end_date]
                @search_dates = (params[:start_date]..params[:end_date])
        end
   end

   def admin_mis_report
       #current day record(Accepted data)
        @survey_reports = SurveyReport.where('Date(created_at) = ?',Date.today).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist = SurveyReport.where('Date(created_at) = ?',Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice = Invoice.where('Date(created_at) = ?', Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")

        #Current month to till date data.(Accepted data)
        @survey_reports1 = SurveyReport.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist1 = SurveyReport.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice1 = Invoice.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
                
        #Total data, Till date from project live(Accepted data)
        @survey_reports2 = SurveyReport.find(:all,:select => 'id', :conditions => 'actions = 1')
        @survey_reports_dist2 = SurveyReport.find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 1')
        @invoice2 = Invoice.find(:all,:select => 'id', :conditions=>"is_invoice = 1", :order=>"id desc")
                
        
        #########################################current day record(Rejected data) #############################################################
        @survey_reports_rej = SurveyReport.where('Date(created_at) = ?',Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist_rej = SurveyReport.where('Date(created_at) = ?',Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice_rej = Invoice.where('Date(created_at) = ?',Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")
                
        #Current month to till date data.(Rejected data)
        @survey_reports1_rej = SurveyReport.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist1_rej = SurveyReport.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions => 'is_tested = 1 and is_dist_approved = 2')
        @invoice1_rej = Invoice.where('created_at >= ? and Date(created_at) <= ?',(Date.today).beginning_of_month, Date.today).find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")

        #Total data, Till date from project live(Rejected data)
        @survey_reports2_rej = SurveyReport.find(:all,:select => 'id', :conditions => 'actions = 2')
        @survey_reports_dist2_rej =  SurveyReport.find(:all, :conditions => 'actions = 1 and is_dist_approved = 2')
        @invoice2_rej = Invoice.find(:all,:select => 'id', :conditions=>"is_invoice = 2", :order=>"id desc")
    end

    def  search_admin_mis_report
        
        if params[:start_date].blank?
                flash[:notice] = "Start date cannot be blank !"
                redirect_to :back
        elsif params[:start_date] > params[:end_date]
                flash[:notice] = "Start date cannot be greater than end date"
                redirect_to :back
        else  params[:start_date] <= params[:end_date]
                @search_dates = (params[:start_date]..params[:end_date])
        end
   end
end
