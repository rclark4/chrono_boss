class UsersController < ApplicationController
	skip_before_filter :authorize, :only => [:new, :create]
	skip_before_filter :authorize_admin, :only => [:new, :create]
	
	def new
	  @user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	    session[:user_id] = @user.id
	    redirect_to home_path, notice: "Thank you for signing up!"
	  else
	    render "new"
	  end
	end

	def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

end