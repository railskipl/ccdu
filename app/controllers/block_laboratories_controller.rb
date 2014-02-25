class BlockLaboratoriesController < ApplicationController
  # GET /block_laboratories
  # GET /block_laboratories.json
  def index
    @block_laboratories = current_user.block_laboratories
     #raise @block_laboratories.inspect
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @block_laboratories }
    end
  end

  # GET /block_laboratories/1
  # GET /block_laboratories/1.json
  def show
    @block_laboratory = BlockLaboratory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @block_laboratory }
    end
  end

  # GET /block_laboratories/new
  # GET /block_laboratories/new.json
  def new
    @block_laboratory = BlockLaboratory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @block_laboratory }
    end
  end

  # GET /block_laboratories/1/edit
  def edit
    @block_laboratory = BlockLaboratory.find(params[:id])
  end

  # POST /block_laboratories
  # POST /block_laboratories.json
  def create
    @block_laboratory = BlockLaboratory.new(params[:block_laboratory])

    respond_to do |format|
      if @block_laboratory.save
        format.html { redirect_to block_laboratories_url, notice: 'Block laboratory was successfully created.' }
        format.json { render json: @block_laboratory, status: :created, location: @block_laboratory }
      else
        format.html { render action: "new" }
        format.json { render json: @block_laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /block_laboratories/1
  # PUT /block_laboratories/1.json
  def update
    @block_laboratory = BlockLaboratory.find(params[:id])

    respond_to do |format|
      if @block_laboratory.update_attributes(params[:block_laboratory])
        format.html { redirect_to block_laboratories_url, notice: 'Block laboratory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @block_laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /block_laboratories/1
  # DELETE /block_laboratories/1.json
  def destroy
    @block_laboratory = BlockLaboratory.find(params[:id])
    @block_laboratory.destroy

    respond_to do |format|
      format.html { redirect_to block_laboratories_url }
      format.json { head :no_content }
    end
  end
end
