helpers do 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]   
  end

  def login(id)
    session[:user_id] = id 
  end

  def logout
    session.delete(:user_id)
  end
end 
