class UsersController < ApplicationController

	# Request to render the view
	def new
		
	end

	# Create the new user
	def create
		user = User.new(params)
		if user.save
			# 
		else
			# 
		end
	end

end
