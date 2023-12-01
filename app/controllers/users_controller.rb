class UsersController < ApplicationController
	devise :omniauthable, omniauth_providers: [:google_oauth2]
	


	def new
	# Your code here
	end

	def create
	# Your code here
	end
end











