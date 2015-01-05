class Users::RegistrationsController < Devise::RegistrationsController 

  def new
    build_resource({})
    self.resource.company = Company.new
    respond_with self.resource
  end

  def create
    @company = Company.new(company_params)
    @user = @company.users.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def company_params
      params.require(:company).permit(:name)
    end
end