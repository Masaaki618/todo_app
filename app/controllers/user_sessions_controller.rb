class UserSessionsController < ApplicationController
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
