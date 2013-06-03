class SessionsController < ApplicationController
	skip_before_filter :authorize, :only => [:new, :create]

  def new
  end

  def create
	  employee = Employee.find_by_email(params[:email])
		  if employee && employee.authenticate(params[:password])
		    session[:employee_id] = employee.id
		    redirect_to employee, notice: "Logged in!"
		  else
		    flash.now.alert = "Email or password is invalid"
		    render "new"
		  end
	end

	def destroy
	  session[:employee_id] = nil
	  redirect_to root_url, notice: "Logged out!"
	end
	
end
