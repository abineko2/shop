class SessionsController < ApplicationController

#ログインページ
  def new
    if logged_in?
      redirect_to moneys_url
    end   
  end

#ログイン処理
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      log_in(user)
      flash[:success] = "ようこそ#{user.name}さん"
      redirect_to user.buyer==true ?buyerTop_moneys_path : moneys_path 
    else
      flash.now[:danger] = "失敗です。"
      render :new
    end 
  end
 
#ログアウト処理
  def destroy  
    flash[:danger] = "ログアウトしました。"
    session.delete(:user_id)
    redirect_to root_path
  end

end
