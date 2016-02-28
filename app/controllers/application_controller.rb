class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



before_filter :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
# Add my attributes added to the devise User class
devise_parameter_sanitizer.for(:sign_up)
devise_parameter_sanitizer.for(:account_update) << :name << :github << :linkedin << :organization
end



  # private

  # def sign_up_params
  #   params.require(:user).permit(:name, :github, :linkedin, :organization, :email, :password, :password_confirmation)
  # end

  # def account_update_params
  #   params.require(:user).permit(:name, :github, :linkedin, :organization, :email, :password, :password_confirmation)
  # end
end
