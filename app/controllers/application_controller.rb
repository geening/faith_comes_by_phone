class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  def default_url_options
    domain = case Rails.env
      when 'development' then "cornerstonesf.fwd.wf"
      when 'production'  then "faith-comes-by-phone.herokuapp.com"
    end
    {:host => domain}
  end
  
end
