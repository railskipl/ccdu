class PrioritiesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@priorities = Priority.all
	end

	def new
		@priority = Priority.new
	end

	def create
		@priority = Priority.create(params[:priority])
		redirect_to priorities_path
	end

	def destroy
		@priority = Priority.find(params[:id])

		@priority.destroy
		redirect_to priorities_path
	end
end
