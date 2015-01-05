class Users::RegistrationsController < Devise::RegistrationsController 
  before_filter :configure_permitted_parameters

  def new
    build_resource({})
    self.resource.company = Company.new
    respond_with self.resource
  end

  def create
    @company = Company.new(company_params)
    @user = @company.users.new(user_params)
    @user.save
    redirect_to users_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def company_params
    params.require(:company).permit(:name)
  end
end