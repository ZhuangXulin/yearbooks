class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  #def create
  #  ##验证邮箱是否存在
  #  user = User.find_for_database_authentication(:email => params[:user][:email])
  #  return render json: {error: {status:-1}} unless user
  #  respond_to do |format|
  #    #验证密码是否正确
  #    if resource.valid_password?(params[:user][:password])
  #      sign_in("user", user)
  #      user.ensure_authentication_token
  #      format.json { 
  #        render json: {token:user.authentication_token, user_id: user.id}
  #      }
  #    else
  #      format.json {
  #        render json: {error: {status:-1}}
  #    }
  #    end
  #  end
  #end

  # DELETE /resource/sign_out
  #def destroy
  #  current_user.authentication_token = Devise.friendly_token
  #  sign_out(current_user)
  #  render json: {success: true}
  #end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
