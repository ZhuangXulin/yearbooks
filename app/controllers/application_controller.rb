class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  
  private
  #判断token的值是否存在，若存在且能在User表中找到相应的，就登陆此用户
  #
  def authenticate_user_from_token!
    token = params[:token].presence
    user = token && User.find_by_authentication_token(token.to_s)
    if user
      sign_in user, sotre: false
    end
  end
end
