class LoginController < ApplicationController
  def login
  end

  #Call the model to authenticate the user email and password 
  #Set session data appropriately
  def process_login
    user = User.find_by_email(params[:email])
    if user != nil && user.password == params[:password]
      session[:id] = user.id
      if user.usertype == 'admin'
        session[:adminuser] = true
        redirect_to :controller => :users
      else
        session[:adminuser] = false
        redirect_to :controller => :users, :action => user.id
      end
    else
      flash[:notice] = "Invalid user/password combination"
      redirect_to :action => 'login'
    end
  end

  #Clear session data on logout
  #Redirect on login
  def logout
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to :action => 'login'
  end
end
