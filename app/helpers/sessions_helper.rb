module SessionsHelper
  def log_in(user)                                                  # 引数(ユーザ)でログイン
    session[:user_id] = user.id
  end
end
