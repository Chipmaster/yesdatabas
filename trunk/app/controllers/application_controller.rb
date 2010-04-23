# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

protected
  def login_required
    return true if session[:id]
    access_denied
    return false
  end

  def access_denied
    session[:return_to] = request.request_uri
    flash[:notice] = 'Oops. You need to login before you can view that page.'
    redirect_to :controller => 'login', :action => 'login'
  end
end
