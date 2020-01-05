module SessionsHelper

#session id 格納
  def log_in(user)　　
    session[:user_id] = user.id
  end

#ログインユーザー準備
  def current_user　
    if session[:user_id]
      user ||= User.find(session[:user_id])
    end    
  end 
  
#ログインしてるか?
  def logged_in?
      !current_user.nil?
  end
    

  
end
