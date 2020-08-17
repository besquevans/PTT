class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  include Pundit

  helper_method :users_signd_in?, :current_user

  private

  def not_authorized
    redirect_to root_path, notice: '權限不足或請付款'
  end

  def not_found
    render file: 'public/404.html', status: 404, layout: false
  end

  def current_user
    @usrrent_user ||= User.find_by(id: session[:user_token])
  end

  def user_sign_in?
    current_user != nil
  end

  def authenticate_user!
    redirect_to root_path, notice: '請登入會員' if not user_sign_in?
  end
end
