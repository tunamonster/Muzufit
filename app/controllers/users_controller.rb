class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else 
			flash[:danger] = 'nope wrong info'
		end
	end

	def show 
	end

private 

	
	
end
