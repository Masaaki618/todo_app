class UserSessionsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :logged_in_user, only: %i(destroy)

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, success: "ログインしました"
    else
      redirect_to login_path, danger: "ログインに失敗しました"
    end
  end

  def destroy
    logout
    redirect_to login_path, success: "ログアウトしました"
  end
end
