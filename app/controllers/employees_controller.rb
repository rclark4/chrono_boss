class EmployeesController < ApplicationController
  # before_filter :authorize, only: [:edit, :update] 
  # before_filter :correct_user, :only => [:edit, :update]
  # before_filter :admin_user,   :only => :destroy
  
  def index
    @employees = Employee.order(:last_name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  def new
    @employee = Employee.new(:vacation_days => 10, :vacation_days_used => 0, :sick_days_used => 0, :sick_days => 5)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end
end