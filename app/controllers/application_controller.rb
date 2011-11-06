class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  
  def current_season
    # TODO: Get REAL current season
    @current_season ||= current_user.group.seasons.first
  end
  helper_method :current_season
end
