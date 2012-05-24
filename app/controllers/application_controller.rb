# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_meet
  layout :small_layout
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def set_meet
    @meet = Meet.first
  end

  def default_url_options(options = {})
    options ||= {} # Why is nil passed to the default_url_options
    small = !!(params && params[:small])
    { :small => small }.merge(options)
  end


  def small_layout
    (params && params[:small]) ? 'small' : 'application'
  end
end
