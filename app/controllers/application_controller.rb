class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_season
    # TODO: Get REAL current season
    @current_season ||= current_user.group.seasons.first
  end
  helper_method :current_season

end
