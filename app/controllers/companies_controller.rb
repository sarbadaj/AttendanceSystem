class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @company = current_user.company
    @users = @company.users
  end
end
