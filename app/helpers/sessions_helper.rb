module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user  #ログインしているユーザーがいる場合はtrue、いない場合はfalseを返す
  end
end
