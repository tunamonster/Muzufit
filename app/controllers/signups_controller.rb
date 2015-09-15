class SignupsController < ApplicationController

	def new 
		@email = Signup.new
	end

	def create
		@email = Signup.new
		if @email.save
			flash[:success] = "Thanks for your interest - You'll hear from us soon."
		else
			flash[:error] = "Thanks for your interest - You'll hear from us soon." #not actually saving, but just so it doesn't look broken
		end
		redirect_to root_url
	end
end
