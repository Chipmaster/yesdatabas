class LoginController < ApplicationController
  def login
    session[:user_id] = nil
    session[:adminuser] = nil
    if request.post?
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        if user.usertype == 'admin'
          session[:adminuser] = true
          redirect_to :controller => :users
        else
          redirect_to :controller => :users, :action => user.id
        end
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end
end
