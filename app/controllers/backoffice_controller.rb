class BackofficeController < ApplicationController
  layout 'backoffice'

  before_action :authenticate

  def index
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
    redirect_to new_backoffice_session_path
  end
  helper_method :current_user

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  def authenticate
    redirect_to new_backoffice_session_path unless logged_in?
  end

end
