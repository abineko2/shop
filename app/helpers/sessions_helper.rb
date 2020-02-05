module SessionsHelper

#session_id格納
def log_in(user)
  session[:user_id] = user.id    
end

#ログインユーザー
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
