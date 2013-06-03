class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  # before_filter :authorize_admin, exclude: [:login]
  skip_before_filter :authorize, only: [:new, :create] 

	private

		def current_employee
		  @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
		end
		helper_method :current_employee

		def authorize
		  redirect_to login_url, alert: "Not authorized" if current_employee.nil?
		end

		def authorize_admin
		  redirect_to root_path, alert: "Not admin" if current_employee.admin? == false
		end

	  def correct_employee
	    @employee = Employee.find(params[:employee_id])
	    redirect_to(root_path) unless current_employee?(@employee)
	  end
	  
	  def admin_employee
	    @employee = Employee.find(params[:id])
	    redirect_to(root_path) if !current_employee.admin? || current_employee?(@employee) || nil
	  end
	end