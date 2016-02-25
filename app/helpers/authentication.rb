helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    !!current_user
  end

  def authorize!
    unless is_logged_in?
      flash[:danger] = "You must log in to view this page!"
      redirect '/login'
    end
  end

  def colors
    ["#E56284","#FFDF00","#FF8C7D","#007685","#CB1C2F","#F5926B","#E38690","#9DC6D8","#00B3CA","#7DD0B6","#28137A","#1D4E89","#C60C31","#9264AC"]
  end

end