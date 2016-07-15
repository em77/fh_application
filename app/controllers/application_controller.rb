class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_referer
    session[:return_to] ||= request.referer
  end
end
