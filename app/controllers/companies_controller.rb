class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user.company.users
    @comapany = current_user.company
  end
end
