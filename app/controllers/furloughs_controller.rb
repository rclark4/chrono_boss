class FurloughsController < ApplicationController

  def index
    @furloughs = Furlough.order(:date_from).reverse

    respond_to do |format|
      format.html
      format.json { render json: @furloughs }
    end
  end

  def show
    @furlough = Furlough.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @furlough }
    end
  end

  def new
    @furlough = Furlough.new

    respond_to do |format|
      format.html
      format.json { render json: @furlough }
    end
  end

  def edit
    @furlough = Furlough.find(params[:id])
  end

  def create
    @furlough = Furlough.new(params[:furlough])

    respond_to do |format|
      if @furlough.save
        format.html { redirect_to @furlough, notice: 'Furlough was successfully created.' }
        format.json { render json: @furlough, status: :created, location: @furlough }
      else
        format.html { render action: "new" }
        format.json { render json: @furlough.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @furlough = Furlough.find(params[:id])

    respond_to do |format|
      if @furlough.update_attributes(params[:furlough])
        format.html { redirect_to @furlough, notice: 'Furlough was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @furlough.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @furlough = Furlough.find(params[:id])
    @furlough.destroy

    respond_to do |format|
      format.html { redirect_to furloughs_url }
      format.json { head :no_content }
    end
  end

  private

  def authorized_employee
    @furlough = current_employee.furloughs.find_by_id(params[:id])
    redirect_to root_path if @furlough.nil?
  end
end