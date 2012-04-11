class ApplicationController < ActionController::Base
  #rescue_from NoMethodError, :with => :record_not_found
 
  protect_from_forgery

  helper_method :current_user
  
  def require_login
    if current_user.nil?
      flash[:error] = "You are not permitted, please login first"
      redirect_to log_in_path
    else
      return current_user
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

   #def record_not_found
    #render "/public/500.html", :status => 500, :layout => false
  #end
end
