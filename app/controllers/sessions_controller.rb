class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
    #session[:return_to] = request.referer
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      #redirect_to session[:return_to],  :alert => "Succesfully logged in"
      redirect_to root_path
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end

end