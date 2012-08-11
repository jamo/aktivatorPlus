class ApplicationController < ActionController::Base
  before_filter  :authenticate_user
  before_filter :current_user
  protect_from_forgery
  #protected
  def authenticate_user
    user = User.find_by_id(session[:user_id])
    unless user
      flash[:error] = "Log in"
      redirect_to(:controller => 'sessions', :action => 'login')
      return false
    else
      # set current user object to @current_user object variable
      @current_user = user
      return true
    end
  end

  def authenticate_user!
    authenticate_user
  end
  #  def save_login_state
  #    if session[:user_id]
  #      redirect_to(:controller => 'sessions', :action => 'home')
  #      return false
  #    else
  #      return true
  #    end
  #  end

  def current_user
    @current_user = User.find_by_id(session[:user_id]) # Use find_by_id to get nil instead of an error if user doesn't exist
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

  def user_signed_in?
     if current_user
       return true
     else
       return false
     end
  end

  ##
  ##  protected
  ##  def authorize
  ##    unless User.find_by_id(session[:user_id])
  ##      redirect_to login_path, :notice => "Please log in"
  ##    end
  ##  end
  ##
end
