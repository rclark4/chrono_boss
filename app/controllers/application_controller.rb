class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  before_filter :authorize_admin, :only => [:index, :new]

	private

		def current_user
		  @current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
		helper_method :current_user

		def authorize
		  redirect_to login_url, alert: "Not authorized" if current_user.nil?
		end

		def authorize_admin
		  redirect_to root_path, alert: "Not admin" if current_user.admin? == false
		end

	  def correct_user
	    @user = User.find(params[:employee_id])
	    redirect_to(root_path) unless current_user?(@user)
	  end
	  
	  def admin_user
	    @user = User.find(params[:id])
	    redirect_to(root_path) if !current_user.admin? || current_user?(@user)
	  end
	end