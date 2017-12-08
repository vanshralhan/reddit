class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def checking
    if user_signed_in?
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end
  # def after_sign_up_path_for(resource)
  #   if current_user.type == "linkuser"
  #     links_path
  #   else
  #     urls_path
  #   end
  # end
end
