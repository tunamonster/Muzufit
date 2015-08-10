class SubscriptionsController < ApplicationController

	def create
		@subscription = Subscription.new
		if @subscription.save 
			flash[:success] = ".						signed up!"
		else
			flash[:error] = ".						you're already signed up for this class!"
		end
		redirect_to root_url
	end


end
