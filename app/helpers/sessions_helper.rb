module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    if @current_user
  return @current_user
  else
  @current_user = User.find_by(id: session[:id])
  return @current_user
    end
  end
  
  
end
