class SignupController < ApplicationController

  skip_before_filter :authorize
  
  def index
  	
    @user = User.new

    render layout: 'splash'

  end

  def create

    @user = User.new user_params

    if @user.save

    	session[:user_id] = @user.id

    	redirect_to root_url, flash: {success: 'Your account was created!'}

    else

    	render :index,layout: 'splash'

    end

  end

  private
  def user_params

  	list = :name, :email, :password, :password_confirmation

  	params.require(:user).permit list

  end

end