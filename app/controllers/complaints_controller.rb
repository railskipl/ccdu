class ComplaintsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@complaints = current_user.complaints.find(:all, :order => "id desc")
	end

	def new
		@complaint = Complaint.new
	end

	def create
		@complaint = Complaint.new(params[:complaint])

		if @complaint.save
			flash[:alert] = "Complaint was successfully created."
			redirect_to complaints_path
		else
			render :new
		end
	end

	def edit
		@complaint = Complaint.find(params[:id])
	end

	def update
		@complaint = Complaint.find(params[:id])

		if @complaint.update_attributes(params[:complaint])
			flash[:alert] = "Complaint was successfully updated."
			redirect_to complaints_path
		else
			render :edit
		end
	end

	def show
		@complaint = Complaint.find(params[:id])
	end

	def invoice_submit
      @complaint = Complaint.find(params[:id])
      @complaint.update_column(:actions, 1)
      redirect_to :back
    end

    def complaint_district
    	@complaints = Complaint.where('district_name = ? and actions = ?', current_user.district_name, 1).find(:all, :order => 'id desc')
    end
end
