class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :password_confirmation, :first_name, :last_name, :gender])
  end
end
