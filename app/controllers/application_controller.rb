  # original

  class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end



#   original

#   class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:sign_up) << :username
#   end
#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception
# end




# ## I tried this.. 12/6/14

# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:sign_up) do |u|
#       u.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
#     end

#   end

#   # is this for using two devise models?
#   # def devise_parameter_sanitizer
#   #   if resource_class == Tenant
#   #     Tenant::ParameterSanitizer.new(Tenant, :tenant, params)
#   #   else
#   #     super # Use the default one
#   #   end
#   # end

#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception
# end

