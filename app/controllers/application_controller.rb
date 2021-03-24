class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_user_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : root_path
  end

  def configure_user_params
    added_attrs = [:first_name, :last_name]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
