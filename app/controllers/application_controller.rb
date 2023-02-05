class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login, :logged_in_user

  def not_authenticated
    flash[:danger] = 'ログインが必要です'
    redirect_to login_path
  end

  def logged_in_user
    redirect_to root_path, warning: "ログイン済みです" if logged_in?
  end
end
