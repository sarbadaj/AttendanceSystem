class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = current_user.company.users
	end
end
