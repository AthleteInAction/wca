class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :authorize

  private

  def current_user

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
  end
  helper_method :current_user

  def is_admin?

  	current_user && current_user.access >= 1

  end
  helper_method :is_admin?

  def authorize

    if current_user.nil?

      redirect_to login_path, flash: {warning: 'Not authorized'}

    else

      current_user.update last_active: Time.now

    end
    
  end

  def admin_authorize

    redirect_to root_path, flash: {warning: 'Not authorized'} if !is_admin?
    
  end

  def icon entity
    Tools.glyphicon entity
  end
  helper_method :icon

end