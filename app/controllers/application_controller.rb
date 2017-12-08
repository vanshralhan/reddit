class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  protect_from_forgery with: :exception


  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected
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
