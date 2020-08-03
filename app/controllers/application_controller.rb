class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found


  helper_method :users_signd_in?, :current_user 

  private
  def not_found
    render file: 'public/404.html', status: 404
  end
  
  def current_user
    @usrrent_user ||= User.find_by(id: session[:user_token])
  end

  def user_sign_in?
    current_user != nil
  end 
end
