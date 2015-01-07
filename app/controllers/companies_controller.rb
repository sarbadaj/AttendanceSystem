class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @comapany = current_user.company
  end
end
