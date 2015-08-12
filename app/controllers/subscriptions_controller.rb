class SubscriptionsController < ApplicationController
	def show
		@subscription = Subscription.find(params[:id])
	end

	def index
		@subscriptions = Subscription.where(subscriber_id: current_user.id)

	end

	def create 
		@cposting = Cposting.find(params[:post_id])	
		Subscription.where(post: @cposting.id, subscriber: current_user.id).create
		flash[:success] = "Subscribed!"
		redirect_to subscriptions_path
	end

	#def unsubscribe
		#Subscription.find(params[:id]).destroy
	#end 

	def destroy
	@subscription = Subscription.find_by_id(params[:id])
	if !@subscription.nil? 
		@subscription.destroy 
		flash[:success] = "Unsubscribed succesfully" 
	else
		flash[:error] = "Already unsubscribed!"
	end
		redirect_to subscriptions_path
	end

end
