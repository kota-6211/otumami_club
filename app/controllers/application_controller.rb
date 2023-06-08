class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_state, only: [:create]



  protected
  def user_state
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to root_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
  end
end
